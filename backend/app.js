const express = require("express");
const body_parser = require("body-parser");
const connectDb = require("./config/db");
const UserRouter = require("./routers/user.router");
const TodoRouter = require("./routers/todo.router");

const { errorHandler, notFound } = require("./middlewares/errorHandler");
const app = express();
connectDb();
app.use(body_parser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/", UserRouter);
app.use("/", TodoRouter);
app.use(notFound);
app.use(errorHandler);
module.exports = app;
