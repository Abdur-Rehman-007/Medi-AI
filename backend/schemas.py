"""
Pydantic schemas for request/response validation
"""

from pydantic import BaseModel, EmailStr
from typing import Optional
from datetime import datetime

# User schemas
class UserBase(BaseModel):
    email: EmailStr
    fullname: str
    role: Optional[str] = "user"

class UserRegister(UserBase):
    password: str

class UserLogin(BaseModel):
    email: EmailStr
    password: str

class UserResponse(UserBase):
    user_id: int
    created_at: datetime

    class Config:
        from_attributes = True

# Token schemas
class TokenResponse(BaseModel):
    access_token: str
    token_type: str
    user_id: int
    email: str
    message: str

# Symptom analysis schemas
class SymptomAnalysisRequest(BaseModel):
    symptoms: str

class SymptomAnalysisResponse(BaseModel):
    status: str
    input_symptoms: list
    message: str
    recommendations: list
    note: Optional[str] = None
