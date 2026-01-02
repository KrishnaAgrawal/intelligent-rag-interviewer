import Interview from "./pages/Interview";

export default function App() {
  return (
    <div style={pageStyle}>
      <Interview />
    </div>
  );
}

const pageStyle = {
  minHeight: "100vh",
  width: "100vw",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  background: "linear-gradient(135deg, #0f2027, #203a43, #2c5364)"
};
