export const API_BASE = "http://localhost:8000";


export async function loginWithImage(base64Image) {
    const res = await fetch(`${API_BASE}/auth/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ image: base64Image })
    });
    
    if (!res.ok) throw new Error("Authentication failed");
    return res.json();
}


export async function askQuestion(query) {
    const res = await fetch(`${API_BASE}/chat/`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ query: query.trim() })
    });

    if (!res.ok) throw new Error("Chat failed");
    return res.json();
}