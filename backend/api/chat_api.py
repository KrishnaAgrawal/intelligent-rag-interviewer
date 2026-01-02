from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from core.orchestrator import handle_query

router = APIRouter(prefix="/chat", tags=["Chat"])

class ChatRequest(BaseModel):
    query: str

@router.post("/")
async def chat(request: ChatRequest):
    # Defensive validation (prevents silent 422s)
    if not request.query or not request.query.strip():
        raise HTTPException(
            status_code=400,
            detail="Query cannot be empty"
        )

    try:
        response = await handle_query(request.query)
        return {
            "response": response
        }
    except Exception as e:
        print("Chat error:", e)
        raise HTTPException(
            status_code=500,
            detail="Internal chat error"
        )
