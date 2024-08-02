const userModel = require("../models/user.js");
const jwt = require("jsonwebtoken");

class userService {
  static async registerUser( username, email, password, confirm_password) {
    try {
      const createUser = new userModel({ username, email, password, confirm_password });
      return await createUser.save();
    } catch(err){
        throw err;
    }
  }

  static async checkUser(email){
    try {
      return await userModel.findOne({email});
    } catch (error) {
      throw error;
    }
  }

  static async generateToken(tokenData, secretKey, jwt_expire){
    return jwt.sign(tokenData, secretKey, { expiresIn: jwt_expire });
  }
}

module.exports = userService;
