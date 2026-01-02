import os
from langchain_community.document_loaders import PyPDFLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_huggingface import HuggingFaceEmbeddings
from langchain_community.vectorstores import FAISS

BASE_DIR = os.path.dirname(__file__)
PDF_DIR = os.path.join(BASE_DIR, "pdfs")
VECTOR_DIR = os.path.join(BASE_DIR, "vector_store")

os.makedirs(VECTOR_DIR, exist_ok=True)

embeddings = HuggingFaceEmbeddings(
    model_name="sentence-transformers/all-MiniLM-L6-v2"
)

documents = []

# --- LOAD PDFs ---
for filename in os.listdir(PDF_DIR):
    if filename.lower().endswith(".pdf"):
        pdf_path = os.path.join(PDF_DIR, filename)
        loader = PyPDFLoader(pdf_path)
        loaded_docs = loader.load()

        if loaded_docs:
            documents.extend(loaded_docs)
            print(f"Loaded {len(loaded_docs)} pages from {filename}")
        else:
            print(f"⚠️ No text extracted from {filename}")

# --- HARD STOP IF NO DOCUMENTS ---
if not documents:
    raise RuntimeError(
        "❌ No documents loaded. "
        "Ensure PDF files exist in backend/rag/pdfs and contain text."
    )

# --- SPLIT ---
splitter = RecursiveCharacterTextSplitter(
    chunk_size=500,
    chunk_overlap=100
)

chunks = splitter.split_documents(documents)

if not chunks:
    raise RuntimeError("❌ Text split resulted in 0 chunks.")

print(f"✅ Created {len(chunks)} text chunks")

# --- CREATE VECTOR STORE ---
db = FAISS.from_documents(chunks, embeddings)
db.save_local(VECTOR_DIR)

print("✅ Vector store created successfully")
