const userModel = require('../models/user')
const bcrypt = require('bcrypt')

exports.register = (data) => 
    new Promise((resolve, reject) => {
        userModel.findOne({
            username: data.username
        }).then(user => {
            if (user) {
                reject({
                    sukses: false,
                    msg: 'Username Telah Terdaftar'
                })
            } else {
                bcrypt.hash(data.password, 10, (err, hash) => {
                    data.password = hash
                    userModel.create(data)
                    .then(() => resolve({
                        sukses: true,
                        msg: 'Berhasil Registrasi'
                    })).catch(() => reject({
                        sukses: false,
                        msg: 'Gagal Registrasi'
                    }))
                })
            }
        })
    })

exports.login = (data) =>
    new Promise((resolve, reject) => {
        userModel.findOne({
            username: data.username
        }).then(user => {
            if (user) {
                if (bcrypt.compareSync(data.password, user.password)) {
                    resolve({
                        sukses: true,
                        msg: 'Berhasil Login',
                        data: user
                    })
                } else {
                    reject({
                        sukses: false,
                        msg: 'Password Anda Salah'
                    })
                }
            } else {
                reject({
                    sukses: false,
                    msg: 'Username Tidak Terdaftar'
                })
            }
        })
    })