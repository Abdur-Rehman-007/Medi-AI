from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime, timezone

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    user_id = Column(Integer, primary_key=True, autoincrement=True)
    fullname = Column(String(150))
    email = Column(String(150), unique=True)
    password_hash = Column(String(255))
    role = Column(String(50))
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

class Student(Base):
    __tablename__ = "students"
    student_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    roll_no = Column(String(100))
    department = Column(String(150))

class Faculty(Base):
    __tablename__ = "faculty"
    faculty_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    designation = Column(String(150))

class Doctor(Base):
    __tablename__ = "doctors"
    doctor_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    specialization = Column(String(150))

class DoctorSchedule(Base):
    __tablename__ = "doctor_schedule"
    schedule_id = Column(Integer, primary_key=True, autoincrement=True)
    doctor_id = Column(Integer, ForeignKey("doctors.doctor_id"))
    day_of_week = Column(String(20))
    start_time = Column(String(20))
    end_time = Column(String(20))

class Appointment(Base):
    __tablename__ = "appointments"
    appointment_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    doctor_id = Column(Integer, ForeignKey("doctors.doctor_id"))
    appointment_date = Column(DateTime)
    status = Column(String(50), default="pending")
    reason = Column(String(255))
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

class AIConsultation(Base):
    __tablename__ = "ai_consultations"
    consultation_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    symptoms = Column(Text)
    ai_response = Column(Text)
    severity_level = Column(String(20), default="low")
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

class SymptomLog(Base):
    __tablename__ = "symptom_logs"
    log_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    symptom_description = Column(Text)
    ai_response = Column(Text)
    logged_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

class Reminder(Base):
    __tablename__ = "reminders"
    reminder_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    message = Column(String(255))
    remind_at = Column(DateTime)
    status = Column(String(20), default="pending")

class CampusLocation(Base):
    __tablename__ = "campus_locations"
    location_id = Column(Integer, primary_key=True, autoincrement=True)
    location_name = Column(String(150))

class AuditLog(Base):
    __tablename__ = "audit_logs"
    audit_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    action = Column(String(255))
    description = Column(Text)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
    
def analyze_symptoms(symptom_text):
    # simple placeholder: echo the input symptoms and return a stub diagnosis
    return {
        "symptoms": symptom_text,
        "diagnosis": "Possible viral infection",
        "confidence": "medium"
    }
