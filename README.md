# 🎮 Intelligent Hybrid RAG-Based Interviewer for Game Character Designers

An intelligent, explainable, multi-agent interview system that evaluates video game character design knowledge using Hybrid Retrieval-Augmented Generation (RAG), structured relational data, and real-time webcam authentication.

## 📌 Project Overview

This project implements a Video Game Character Designer Interviewer that simulates a structured technical interview.
The system dynamically reasons over creative design knowledge and factual constraints, selects the most suitable response using multiple agents, and presents answers through a production-grade React interface.

Unlike generic chatbots, this system emphasizes:
- Hybrid knowledge reasoning
- Explainable multi-agent decision making
- Interview-oriented responses
- Real authentication via webcam

### Why this project?
This system was designed to demonstrate intelligent system design by combining hybrid RAG, multi-agent reasoning, and real-world authentication in an interview simulation context.

## 📂 Tech Stack
## Backend

- FastAPI
- Python
- LangChain
- FAISS (Vector Database)
- PostgreSQL
- OpenCV (Face Detection)

## Frontend

- React (Vite)
- Modern Hooks (useEffect, useRef, useState)
- Style objects (CSS-in-JS)

## ⚙️ Installation & Setup Guide (Step by Step)
### Prerequisites
- Python 3.10+
- Node.js 18+
- PostgreSQL 14+ (optional)
- Git
- Webcam-enabled device

### 1️⃣ Clone Repository
```
git clone https://github.com/your-username/intelligent-rag-interviewer.git
cd intelligent-rag-interviewer
```

### 2️⃣ Backend Setup (FastAPI)
```
cd backend
python -m venv venv
venv\Scripts\activate      # Windows
# source venv/bin/activate # macOS/Linux
```

### Install dependencies
```
pip install -r requirements.txt
```
### Note: It may take some time.

### 3️⃣ (Optional) PostgreSQL Setup
```
CREATE DATABASE game_interviewer;
```
- Restore the game_interviewer.sql into the database from backend/database/game_interviewer.sql
- Update DB config (like: user, password) in backend/database/db.py
- If PostgreSQL is unavailable, the system gracefully falls back to vector-based reasoning.

### 4️⃣ Prepare Vector Database (RAG)
Run ingestion:
```
cd backend
python rag/ingest.py
```
### Note: It may take some time.

### 5️⃣ Start Backend Server
```
uvicorn main:app --reload
```

Backend:
```
http://localhost:8000
```

Verify backend at
```
http://localhost:8000/docs
```

### 6️⃣ Frontend Setup (React)
```
cd ../frontend
npm install
npm run dev
```

Frontend:
```
http://localhost:5173
```

### 7️⃣ Verify
1. Open frontend URL - Give permission to the webcam
2. Login using webcam (Face recognition)
3. Ask an interview question
4. Receive AI-generated response

## 🧪 Sample Interview Questions

### RAG Based
- How do you ensure a character is visually recognizable?
- How do you design characters for inexperienced players?
- How do gameplay mechanics influence character design?
### Hybrid (PDF knowledge + structured constraints)
- Design a beginner-friendly RPG character for a mobile game. What constraints would you consider?
- How do production constraints affect visual design?

### Note: Future Enhancements – Unstructured Knowledge 
- Although the system uses hybrid retrieval, responses are intentionally unstructured to reflect how human designers articulate reasoning during interviews.
- Structured data is used to constrain reasoning, while unstructured output enables explanation and justification.
- The system can be extended with semantic chunking, concept-level indexing, confidence-weighted retrieval, and hallucination guardrails to further improve reasoning quality.


## 🚀 Future Enhancements
- Identity-based face recognition
- Candidate skill scoring dashboard
- Adaptive interview difficulty
- Long-term interview memory
- Deployment via Docker

## 🧠 Core Features
## ✅ Hybrid RAG (Retrieval-Augmented Generation)
- Unstructured Knowledge:
Game design theory, character modeling principles, visual design research (PDFs → Vector Database)

- Structured Knowledge:
Character archetypes, constraints, mechanics, genres (PostgreSQL)

The system dynamically decides whether to use:

- Vector retrieval
- SQL queries
- Or both (hybrid)

## ✅ Intent-Aware Query Routing
Each user question is analyzed to infer intent:

- Design theory → Vector DB
- Constraints / mechanics → SQL
- Mixed → Hybrid retrieval

This reduces hallucinations and improves relevance.

## ✅ Multi-Agent Architecture
- Creative Agent – narrative & conceptual reasoning
- Analytical Agent – structured, constraint-aware reasoning
- Evaluator Agent – selects or blends responses based on relevance

Agents operate in parallel, and a selector chooses the final answer.

## ✅ Explainable Reasoning (Internal Trace)
Each response includes an internal reasoning trace (logged, not shown in UI):

- Which knowledge source was used
- Which agents were involved
- Which agent response was selected
- Confidence estimation

This improves transparency and debuggability.

## ✅ Webcam-Based Authentication
- Browser-side webcam capture
- Backend face detection using OpenCV
- Camera lifecycle managed correctly (opened on mount, closed on unmount)

This demonstrates real-time authentication, not mock login.

✅ Production-Grade React UI

- Clean, centered layout
- Webcam login screen
- Stateless interview Q&A interface
- Submit & Clear actions
- Loading and error handling
- Camera closes after authentication

## 🏗️ System Architecture
```
┌──────────────┐
│  React UI    │
│ (Webcam + QA)│
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ FastAPI API  │
│  Auth + Chat │
└──────┬───────┘
       │
       ▼
┌────────────────────────────┐
│     Core Orchestrator      │
│  (Intent + Agent Control)  │
└──────┬──────────────┬──────┘
       │              │
       ▼              ▼
┌──────────────┐  ┌──────────────┐
│ Vector Store │  │ PostgreSQL   │
│ (PDF RAG)    │  │ (Constraints)│
└──────────────┘  └──────────────┘
```

## 🔁 Interview Flow
1. User authenticates via webcam
2. Camera is closed after login
3. User submits a design interview question
4. System:
    - Infers question intent
    - Retrieves relevant knowledge
    - Generates parallel agent responses
    - Evaluates and selects best answer
5. Final response returned (stateless)

## 🧩 Design Decisions
- ### Stateless Interaction
    Each question is evaluated independently, as in real interviews.

- ### Hybrid Retrieval
    Different knowledge types require different retrieval strategies.

- ### Multi-Agent Reasoning
    Prevents single-perspective answers.

- ### Explainability
    Internal reasoning traces improve trust and evaluation.

- ### Minimal UI, Strong UX
    Focus on reasoning, not visual distraction.

## ⚠️ Known Limitations
- Face authentication checks for face presence, not identity matching
- No long-term candidate memory (by design)
- Confidence scores are internal only

## 🎓 Academic & Interview Readiness
This project demonstrates:
- Intelligent system design
- Hybrid RAG reasoning
- Multi-agent architectures
- Explainable AI principles
- Production-grade frontend/backend integration

## 📜 License
This project is for academic and portfolio purposes.