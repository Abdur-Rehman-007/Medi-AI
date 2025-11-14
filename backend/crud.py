"""
CRUD operations for database interactions
"""

from sqlalchemy.orm import Session
from models import User
from auth import hash_password, verify_password

def get_user_by_email(db: Session, email: str):
    """Get a user by email"""
    return db.query(User).filter(User.email == email).first()

def get_user_by_id(db: Session, user_id: int):
    """Get a user by ID"""
    return db.query(User).filter(User.user_id == user_id).first()

def create_user(db: Session, email: str, fullname: str, password: str, role: str = "user"):
    """Create a new user"""
    # Check if user already exists
    existing_user = get_user_by_email(db, email)
    if existing_user:
        return None
    
    # Hash the password
    hashed_password = hash_password(password)
    
    # Create new user
    db_user = User(
        email=email,
        fullname=fullname,
        password_hash=hashed_password,
        role=role
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def authenticate_user(db: Session, email: str, password: str):
    """Authenticate a user by email and password"""
    user = get_user_by_email(db, email)
    if not user:
        return None
    if not verify_password(password, user.password_hash):
        return None
    return user
