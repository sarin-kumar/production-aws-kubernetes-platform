const express = require("express");
const { Pool } = require("pg");

const app = express();
app.use(express.json());

const port = process.env.PORT || 8080;

const pool = process.env.DATABASE_URL
  ? new Pool({ connectionString: process.env.DATABASE_URL })
  : null;

app.get("/health", (_req, res) => {
  res.json({ status: "ok", service: "backend" });
});

app.get("/ready", async (_req, res) => {
  if (!pool) return res.json({ status: "ready", database: "not-configured" });
  try {
    await pool.query("SELECT 1");
    res.json({ status: "ready", database: "ok" });
  } catch (err) {
    res.status(503).json({ status: "not-ready", database: "unavailable" });
  }
});

app.get("/api/users", async (_req, res) => {
  if (!pool) return res.json([{ id: 1, name: "Demo User" }]);
  try {
    const result = await pool.query("SELECT id, name FROM users ORDER BY id");
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: "database query failed" });
  }
});

if (require.main === module) {
  app.listen(port, "0.0.0.0", () => {
    console.log(`Backend listening on ${port}`);
  });
}

module.exports = app;
