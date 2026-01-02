import face_recognition
import cv2
import pickle
import os

ENCODINGS_FILE = "auth/known_faces/encodings.pkl"

def register_face(user_name):
    video = cv2.VideoCapture(0)
    print("Press 's' to save face")

    while True:
        ret, frame = video.read()
        cv2.imshow("Register Face", frame)

        if cv2.waitKey(1) & 0xFF == ord('s'):
            rgb = frame[:, :, ::-1]
            encodings = face_recognition.face_encodings(rgb)

            if len(encodings) == 0:
                print("No face detected")
                continue

            encoding = encodings[0]
            break

    video.release()
    cv2.destroyAllWindows()

    if os.path.exists(ENCODINGS_FILE):
        with open(ENCODINGS_FILE, "rb") as f:
            data = pickle.load(f)
    else:
        data = {}

    data[user_name] = encoding

    with open(ENCODINGS_FILE, "wb") as f:
        pickle.dump(data, f)

    print(f"Face registered for {user_name}")

register_face("designer_1")
