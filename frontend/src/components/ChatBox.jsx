import React, { useState } from "react";
import { askQuestion } from "../api/client";
import styles from "../styles/uiStyles";

export function ChatBox() {
  const [query, setQuery] = useState("");
  const [response, setResponse] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const submit = async () => {
    if (!query.trim()) return;
    setLoading(true);
    setError(null);
    setResponse("");

    try {
      const data = await askQuestion(query);
      setResponse(data.response);
    } catch {
      setError("Failed to get response from server");
    } finally {
      setLoading(false);
    }
  };

  const clear = () => {
    setQuery("");
    setResponse("");
    setError(null);
  };

  return (
    <div style={styles.card}>
      <h2 style={styles.title}>Interview Question</h2>

      <textarea
        value={query}
        onChange={e => setQuery(e.target.value)}
        placeholder="Type your interview question here…"
        style={styles.textarea}
        disabled={loading}
      />

      <div style={styles.actions}>
        <button onClick={submit} disabled={loading} style={styles.primaryBtn}>
          Submit
        </button>
        <button onClick={clear} style={styles.secondaryBtn}>
          Clear
        </button>
      </div>

      {loading && <p>Thinking…</p>}
      {error && <p style={styles.error}>{error}</p>}

      {response && (
        <div style={styles.answerBox}>
          <strong>Answer</strong>
          <p>{response}</p>
        </div>
      )}
    </div>
  );
}