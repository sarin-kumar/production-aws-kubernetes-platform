import React, { useEffect, useState } from "react";
import { createRoot } from "react-dom/client";

function App() {
  const [health, setHealth] = useState("checking...");
  const apiUrl = import.meta.env.VITE_API_URL || "http://localhost:8080";

  useEffect(() => {
    fetch(`${apiUrl}/health`)
      .then((r) => r.json())
      .then((data) => setHealth(data.status))
      .catch(() => setHealth("unavailable"));
  }, [apiUrl]);

  return (
    <main style={{fontFamily: "Arial", maxWidth: 900, margin: "60px auto", padding: 24}}>
      <h1>Production AWS Kubernetes Platform</h1>
      <p>React frontend running in a container.</p>
      <p><strong>Backend health:</strong> {health}</p>
      <p>Target architecture: GitHub → CI → ECR → EKS → ALB → Backend → RDS.</p>
    </main>
  );
}

createRoot(document.getElementById("root")).render(<App />);
