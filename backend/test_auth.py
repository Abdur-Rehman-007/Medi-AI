"""
Test script for Medi-AI authentication endpoints
"""

import requests
import json

BASE_URL = "http://127.0.0.1:8000"

print("=" * 60)
print("MEDI-AI AUTHENTICATION TEST")
print("=" * 60)

# Test 1: Register a new user
print("\n1. Testing USER REGISTRATION...")
register_data = {
    "email": "test@example.com",
    "fullname": "John Doe",
    "password": "securepassword123",
    "role": "student"
}

response = requests.post(f"{BASE_URL}/auth/register", json=register_data)
print(f"Status Code: {response.status_code}")
print(f"Response: {json.dumps(response.json(), indent=2)}")

if response.status_code == 200:
    token = response.json()["access_token"]
    user_id = response.json()["user_id"]
    print("✓ Registration successful!")
else:
    print("✗ Registration failed!")
    exit()

# Test 2: Login with credentials
print("\n2. Testing USER LOGIN...")
login_data = {
    "email": "test@example.com",
    "password": "securepassword123"
}

response = requests.post(f"{BASE_URL}/auth/login", json=login_data)
print(f"Status Code: {response.status_code}")
print(f"Response: {json.dumps(response.json(), indent=2)}")

if response.status_code == 200:
    login_token = response.json()["access_token"]
    print("✓ Login successful!")
else:
    print("✗ Login failed!")

# Test 3: Get user profile (requires authentication)
print("\n3. Testing GET USER PROFILE (Protected)...")
headers = {"Authorization": f"Bearer {token}"}
response = requests.get(f"{BASE_URL}/user/profile", headers=headers)
print(f"Status Code: {response.status_code}")
print(f"Response: {json.dumps(response.json(), indent=2)}")

if response.status_code == 200:
    print("✓ Profile retrieval successful!")
else:
    print("✗ Profile retrieval failed!")

# Test 4: Symptom analysis (without authentication)
print("\n4. Testing SYMPTOM ANALYSIS (Public)...")
symptom_data = {"symptoms": "fever, cough, headache"}
response = requests.post(f"{BASE_URL}/symptoms/analyze", json=symptom_data)
print(f"Status Code: {response.status_code}")
print(f"Response: {json.dumps(response.json(), indent=2)}")

# Test 5: Symptom analysis (with authentication)
print("\n5. Testing SYMPTOM ANALYSIS (Authenticated)...")
headers = {"Authorization": f"Bearer {token}"}
response = requests.post(f"{BASE_URL}/symptoms/analyze/authenticated", json=symptom_data, headers=headers)
print(f"Status Code: {response.status_code}")
print(f"Response: {json.dumps(response.json(), indent=2)}")

print("\n" + "=" * 60)
print("TEST COMPLETED!")
print("=" * 60)
