import React, { useEffect, useRef, useState } from "react";
import { loginWithImage } from "../api/client";
import styles from "../styles/uiStyles";

export function WebcamLogin({ onSuccess }) {
    const videoRef = useRef(null);
    const canvasRef = useRef(null);
    const streamRef = useRef(null);

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(stream => {
                streamRef.current = stream;
                videoRef.current.srcObject = stream;
            })
            .catch(() => setError("Unable to access webcam"));
    }, []);

    const stopCamera = () => {
        if (streamRef.current) {
            streamRef.current.getTracks().forEach(track => track.stop());
            streamRef.current = null;
        }

        if (videoRef.current) {
            videoRef.current.srcObject = null;
        }
    };


    const captureAndLogin = async () => {
        setLoading(true);
        setError(null);

        const canvas = canvasRef.current;
        const video = videoRef.current;

        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        const ctx = canvas.getContext("2d");
        ctx.drawImage(video, 0, 0);

        const base64Image = canvas.toDataURL("image/jpeg");

        try {
            stopCamera(); // CLOSE CAMERA
            await loginWithImage(base64Image);
            onSuccess();
        } catch {
            setError("Face authentication failed. Please try again.");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div style={styles.card}>
            <h2 style={styles.title}>Webcam Authentication</h2>
            <video ref={videoRef} autoPlay playsInline style={styles.video} />
            <canvas ref={canvasRef} style={{ display: "none" }} />

            {error && <p style={styles.error}>{error}</p>}

            <button onClick={captureAndLogin} disabled={loading} style={styles.primaryBtn}>
                {loading ? "Authenticating…" : "Login"}
            </button>
        </div>
    );
}