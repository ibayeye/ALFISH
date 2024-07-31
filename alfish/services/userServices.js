const userModel = require("../models/user.js");

class userService {
  static async registerUser( username, email, password, confirm_password) {
    try {
      const createUser = new userModel({ username, email, password, confirm_password });
      return await createUser.save();
    } catch(err){
        throw err;
    }
  }
}

module.exports = userService;
