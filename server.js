import express from "express";
const app = express();

app.get("/", (req, res) => {
  res.send("Streemza API is running (Azure scalable demo) ✅");
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`API listening on :${PORT}`);
});
