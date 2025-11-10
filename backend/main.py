from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Medi-AI backend is running successfully!"}
