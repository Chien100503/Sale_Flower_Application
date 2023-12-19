const mongoose = require("mongoose");

const fcConnect = async () => {
  console.log("run at here");
  const connectDb = await mongoose.connect("mongodb://localhost:27017/App");
  if (connectDb) {
    console.log("connected!");
  } else {
    console.log("false!");
  }
};

module.exports = fcConnect;
