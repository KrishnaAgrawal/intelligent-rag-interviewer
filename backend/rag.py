import os
import chromadb

# Absolute path (important on Windows)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
CHROMA_DIR = os.path.join(BASE_DIR, "chroma_db")

# Persistent client (REQUIRED in Chroma 1.x)
client = chromadb.PersistentClient(path=CHROMA_DIR)

# Create / load collection
collection = client.get_or_create_collection(
    name="game_design_knowledge"
)

def add_document(text: str, metadata: dict):
    collection.add(
        documents=[text],
        metadatas=[metadata],
        ids=[str(hash(text))]
    )

def search_documents(query: str, filters=None):
    return collection.query(
        query_texts=[query],
        n_results=3,
        where=filters
    )["documents"]
