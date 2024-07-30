const mongoose = require('mongoose')
const Schema = mongoose.Schema

const userSchema = new Schema({
    username: {
        type: String
    },
    password: {
        type: String
    },
    nama: {
        type: String
    },
    email: {
        type: String
    },
    role: {
        type: Number,
        default: 1 // 1 user biasa 2 admin
    }
})

module.exports = mongoose.model('user', userSchema)