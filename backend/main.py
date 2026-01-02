from fastapi import FastAPI
from api.auth_api import router as auth_router
from api.chat_api import router as chat_router

app = FastAPI(
    title="Intelligent Hybrid RAG Interview Chatbot",
    version="1.0"
)
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # React dev server
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth_router)
app.include_router(chat_router)

@app.get("/")
def health():
    return {"status": "running"}
