# System Design Document (SDD)
### Project: Medi-AI
### Team: Abdurehman, Zoha Shahid, Attqa Khan
---

## 1. Introduction
Medi-AI is a mobile-based healthcare guidance and appointment system designed for BUITEMS. It connects students, faculty, and doctors through an AI-powered platform for symptom analysis and consultations.

---

## 2. System Overview
**Architecture:**
- Mobile app (Flutter) sends requests to backend.
- Backend (FastAPI) handles logic and stores data.
- Database (MySQL) saves users, consultations, and appointments.
- Gemini API provides AI-based symptom analysis.

[Mobile App] ⇄ [FastAPI Backend] ⇄ [MySQL Database] ⇄ [Gemini API]

## 3. Main Modules
1. **Authentication Module**
   - Login, registration, JWT-based security.
2. **AI Symptom Analysis**
   - Uses Gemini to provide suggestions based on user symptoms.
3. **Consultation Management**
   - Students/faculty can request consultations; doctors can approve or reject.
4. **Doctor/Admin Portal**
   - Doctors view appointments and patient history.
5. **Medicine Reminder**
   - Offline reminder system using local notifications.

---

## 4. Database Design (Draft)
Tables planned:
- Users
- Doctors
- Symptom_Requests
- Consultations
- Appointments
- Medications

---

## 5. API Endpoints (Planned)
| Endpoint | Method | Description |
|-----------|---------|-------------|
| /auth/register | POST | Register new user |
| /auth/login | POST | Log in user |
| /symptoms/analyze | POST | Analyze symptoms via AI |
| /consultations/request | POST | Create consultation request |
| /consultations/approve | PUT | Approve consultation |

---

## 6. Tools & Environment
| Tool | Purpose |
|------|----------|
| Flutter | Frontend mobile app |
| FastAPI | Backend API framework |
| MySQL | Database |
| Gemini | AI model for symptom analysis |
| Postman | API testing |
| MySQL Workbench | Database modeling |
| Vs Code | Emulator and APK testing |

---

## 7. Future Enhancements
- Add chat between doctor and patient.
- Include health tips based on common symptoms.
- Allow image uploads for medical reports.

