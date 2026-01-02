from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import base64
import cv2
import numpy as np
from auth.recognize_face import authenticate_user

router = APIRouter(prefix="/auth", tags=["Authentication"])


class LoginRequest(BaseModel):
    image: str


@router.post("/login")
def login(req: LoginRequest):
    try:
        # ---- Decode base64 image ----
        encoded = req.image.split(",")[1]
        img_bytes = base64.b64decode(encoded)
        img_array = np.frombuffer(img_bytes, np.uint8)
        frame = cv2.imdecode(img_array, cv2.IMREAD_COLOR)

        if frame is None:
            raise HTTPException(status_code=400, detail="Invalid image")

        # ---- Face authentication ----
        if not authenticate_user(frame):
            raise HTTPException(status_code=401, detail="Face authentication failed")

        return {"status": "authenticated"}

    except Exception as e:
        print("Auth error:", e)
        raise HTTPException(status_code=401, detail="Authentication failed")
