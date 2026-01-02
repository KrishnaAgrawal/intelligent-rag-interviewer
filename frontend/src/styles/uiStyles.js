
const styles = {
    page: {
        minHeight: "100vh",
        background: "linear-gradient(135deg, #0f2027, #203a43, #2c5364)",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        color: "#fff",
        fontFamily: "Inter, Arial, sans-serif"
    },

    card: {
        background: "#111827",
        padding: 24,
        borderRadius: 16,
        width: 420,
        boxShadow: "0 20px 40px rgba(0,0,0,0.5)",
        textAlign: "center",
        color: "#fff",
        justifyContent: "center"
    },

    title: {
        marginBottom: 16
    },

    video: {
        width: "100%",
        borderRadius: 12,
        marginBottom: 12
    },

    textarea: {
        width: "90%",
        minHeight: 80,
        borderRadius: 10,
        padding: 12,
        fontSize: 14,
        border: "1px solid #374151",
        background: "#1f2937",
        color: "#fff"
    },

    actions: {
        display: "flex",
        gap: 12,
        marginTop: 12,
        justifyContent: "center"
    },

    primaryBtn: {
        background: "#3b82f6",
        color: "white",
        padding: "10px 18px",
        borderRadius: 10,
        border: "none",
        cursor: "pointer"
    },

    secondaryBtn: {
        background: "#374151",
        color: "white",
        padding: "10px 18px",
        borderRadius: 10,
        border: "none",
        cursor: "pointer"
    },

    answerBox: {
        marginTop: 16,
        background: "#1f2937",
        padding: 14,
        borderRadius: 10,
        textAlign: "left"
    },

    error: {
        color: "#f87171",
        marginTop: 8
    }
}
;

export default styles;