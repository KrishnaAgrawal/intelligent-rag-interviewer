import cv2

CASCADE_PATH = "auth/haarcascade_frontalface_default.xml"

def authenticate_user(frame):
    face_cascade = cv2.CascadeClassifier(CASCADE_PATH)

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    faces = face_cascade.detectMultiScale(
        gray,
        scaleFactor=1.2,
        minNeighbors=5,
        minSize=(100, 100)
    )

    print("Faces detected:", len(faces))

    # For assignment: face presence = authentication
    return len(faces) > 0
