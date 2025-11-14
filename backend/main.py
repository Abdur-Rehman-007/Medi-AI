from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from sqlalchemy.orm import Session
from datetime import timedelta

from ai_module import analyze_symptoms
from database import SessionLocal
from auth import create_access_token, verify_token, ACCESS_TOKEN_EXPIRE_MINUTES
from schemas import UserRegister, UserLogin, TokenResponse, UserResponse, SymptomAnalysisRequest
from crud import create_user, authenticate_user, get_user_by_id

app = FastAPI(title="Medi-AI API", version="1.0.0")
security = HTTPBearer()

# Dependency to get database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def root():
    return {
        "message": "Medi-AI backend is running",
        "status": "ok",
        "docs": "Visit /docs for API documentation"
    }

# ============ Authentication Endpoints ============

@app.post("/auth/register", response_model=TokenResponse)
def register(user_data: UserRegister, db: Session = Depends(get_db)):
    """Register a new user"""
    db_user = create_user(
        db=db,
        email=user_data.email,
        fullname=user_data.fullname,
        password=user_data.password,
        role=user_data.role
    )
    
    if not db_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Email already registered"
        )
    
    # Create JWT token
    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        data={"sub": db_user.email},
        expires_delta=access_token_expires
    )
    
    return {
        "access_token": access_token,
        "token_type": "bearer",
        "user_id": db_user.user_id,
        "email": db_user.email,
        "message": "User registered successfully"
    }

@app.post("/auth/login", response_model=TokenResponse)
def login(user_data: UserLogin, db: Session = Depends(get_db)):
    """Login user and return JWT token"""
    db_user = authenticate_user(db, user_data.email, user_data.password)
    
    if not db_user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid email or password"
        )
    
    # Create JWT token
    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        data={"sub": db_user.email},
        expires_delta=access_token_expires
    )
    
    return {
        "access_token": access_token,
        "token_type": "bearer",
        "user_id": db_user.user_id,
        "email": db_user.email,
        "message": "Login successful"
    }

# ============ Protected Endpoints ============

def get_current_user(credentials: HTTPAuthorizationCredentials = Depends(security), db: Session = Depends(get_db)):
    """Verify JWT token and get current user"""
    token = credentials.credentials
    email = verify_token(token)
    
    if not email:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid or expired token"
        )
    
    user = db.query(__import__('models').User).filter_by(email=email).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="User not found"
        )
    
    return user

@app.get("/user/profile", response_model=UserResponse)
def get_profile(current_user = Depends(get_current_user)):
    """Get current user profile"""
    return current_user

# ============ AI/Symptom Analysis Endpoints ============

@app.post("/symptoms/analyze")
def analyze(data: SymptomAnalysisRequest):
    """Analyze symptoms and return recommendations"""
    result = analyze_symptoms(data.symptoms)
    return result

@app.post("/symptoms/analyze/authenticated")
def analyze_authenticated(data: SymptomAnalysisRequest, current_user = Depends(get_current_user)):
    """Analyze symptoms (requires authentication)"""
    result = analyze_symptoms(data.symptoms)
    return {
        **result,
        "analyzed_by": current_user.email,
        "user_id": current_user.user_id
    }
