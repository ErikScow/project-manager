import dotenv from "dotenv";
import express from "express";
import cors from "cors";

const server = express();

server.use(cors());
server.use(express.json());

const port = process.env.PORT || 5000;

server.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
