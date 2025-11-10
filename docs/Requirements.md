# Medi-AI: Requirements Document

## Functional Requirements
1. Students and faculty can register and log in to the app.
2. Users can input symptoms to get AI-generated suggestions.
3. Doctors can view, approve, or reject consultation requests.
4. The app sends medicine reminders even without internet.
5. Admin can manage doctors and system data.

## Non-Functional Requirements
1. The system should respond within 2 seconds for most requests.
2. The mobile app should work offline for reminders.
3. The backend must be secure and use JWT for authentication.
4. Data must be stored safely in MySQL.
5. The interface should be simple and user-friendly.

## Tools & Technologies
- **Frontend**: Flutter (Dart)
- **Backend**: FastAPI (Python)
- **Database**: MySQL
- **AI Integration**: Gemini API
- **Tools**: Android Studio, VS Code, Postman, MySQL Workbench
