const mongoose = require('mongoose')
const bcrypt = require('bcrypt')
const db = require('../config/database.js')
const { Schema } = mongoose;

const userSchema = new Schema({
    username: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        lowercase: true
    },
    password: {
        type: String,
        required: true
    },
    confirm_password: {
        type: String,
        required: true
    }
});

userSchema.pre('save', async function() {
    try {
        var user = this;
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(user.password && user.confirm_password, salt);
        user.password = hash; 
        user.confirm_password = hash;
    } catch (error) {
        throw error;
    }
});

userSchema.methods.comparePassword = async function(userPassword) {
    try {
        const isMatch = await bcrypt.compare(userPassword, this.password);
        return isMatch;
    } catch (error) {
        throw error;
    }
}

const userModel =  db.model('user', userSchema)

module.exports = userModel;