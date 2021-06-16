const dotenv = require("dotenv");
const express = require("express");
const cors = require("cors");

const server = express();

server.use(cors());
server.use(express.json());

const port = process.env.PORT || 5000;

server.listen(port, (err) => {
  if (err) {
    console.log(err);
  } else {
    console.log(`Server listening on port ${port}`);
  }
});
