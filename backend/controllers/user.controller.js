const UserService = require("../services/user.service");
const userModel = require("../model/user.model");


exports.register = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const emailRegex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    if (!emailRegex.test(email)) {
      console.log("Email is not in a valid format" );
      return res.status(400).json({ message: "Email is not in a valid format" });
    }

    if (password.length < 6) {
      console.log("Password must be longer than 6 characters" );
      return res.status(400).json({ message: "Password must be longer than 6 characters" });
    }

    const existingUser = await userModel.findOne({ email: email });
    if (existingUser) {
      console.log("Email already exists");
      return res.status(409).json({ message: "Email already exists" });
    }

    const newUser = await userModel.create({ email: email, password: password });

    res.status(200).json({
      status: true,
      success: "User Register successfully",
    });
  } catch (error) {
    console.error("Error during user registration:", error);
    res.status(500).json({ status: false, message: "Internal server error" });
  }
};


exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const user = await UserService.checkUser(email);

    if (!user) {
      return res.status(401).json({ status: false, message: "Invalid credentials" });
    }

    const isMatch = await user.comparePassword(password);
    if (!isMatch) {
      return res.status(401).json({ status: false, message: "Invalid credentials" });
    }

    let tokenData = { _id: user._id, email: user.email };

    const token = await UserService.generateToken(tokenData, "secretKey", "1h");

    res.status(200).json({ status: true, token: token, userId: user._id, email: user.email });
  } catch (error) {
    console.error("Error during login:", error);
    res.status(500).json({ status: false, message: "Internal server error" });
  }
};
