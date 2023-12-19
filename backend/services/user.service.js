const UserModel = require("../model/user.model");
const jwt = require("jsonwebtoken");

class UserService {
  static async registerUser(email, password) {
    try {
      return await UserModel.create({ email: email, password: password });
    } catch (err) {
      throw err;
    }
  }
  static async checkUser(email) {
    try {
      const user = await UserModel.findOne({ email });
      console.log("check user", user);
      return user;
    } catch (error) {
      throw err;
    }
  }

  static async generateToken(tokenData, secretKey, jwt_expire) {
    return jwt.sign(tokenData, secretKey, { expiresIn: jwt_expire });
  }
}

module.exports = UserService;
