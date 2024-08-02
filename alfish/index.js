
const express = require("express");
const app = express();
const router = require("./routes/index.js");
const cors = require("cors");
const dotenv = require("dotenv");
const body_parser = require("body-parser");
const db = require("./config/database.js");
const userRoutes = require("./routes/userRoutes.js");

const userModel = require("./models/user.js");

dotenv.config();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(body_parser.json());
app.use('/', router);
app.use('/', userRoutes);


const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log(`Server berlajan di http://localhost:${PORT}`);
});
