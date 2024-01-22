const db = require("../config/db");
const mongoose = require("mongoose");
const UserModel = require("./user.model");

const { Schema } = mongoose;

const todoSchema = new Schema({
  UserId: {
    type: Schema.Types.ObjectId,
    ref: "UserModel",
  },
  title: {
    type: "string",
    require: true,
  },
  description: {
    type: "string",
    require: true,
  },
  // thêm trường
  detail: {
    type: "string",
    require: true,
  },
  // classify: {
  //   type: "string",
  //   require: true,
  // },
  // quantity: {
  //   type: "number",
  //   require: true,
  // },
  image: {
    type: "string",
  },
  price: {
    type: "number",
    require: true,
  },
});

const TodoModel = mongoose.model("todo", todoSchema);
module.exports = TodoModel;
