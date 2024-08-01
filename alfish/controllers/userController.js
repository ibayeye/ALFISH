const userService = require("../services/userServices");

exports.register = async(req, res, next) => {
    try {
        const { username, email, password, confirm_password } = req.body;

        // Validasi input
        if (!username || !email || !password || !confirm_password) {
            return res.status(400).json({status: false, error: "Semua field harus diisi"});
        }

        if (password !== confirm_password) {
            return res.status(400).json({status: false, error: "Password dan Konfirmasi Password tidak cocok"});
        }

        const successRes = await userService.registerUser(username, email, password, confirm_password);
        res.json({status: true, success: "User berhasil didaftarkan"});
    } catch(err) {
        next(err);
    }
}
exports.login = async(req, res, next) => {
    try {
        const { email, password } = req.body;

        const user = await userService.checkUser(email)

        // Validasi input
        if (!user) {
            return res.status(400).json({status: false, error: "Email tidak ditemukan"});
        }

        const isMatch = await user.comparePassword(password);

        if (isMatch === false) {
            return res.status(400).json({status: false, error: "Password tidak cocok"});
        }

        let tokenData = {_id:user._id, email:user.email};

        const token = await userService.generateToken(tokenData, "secretKey", '7d');

        res.status(200).json({status: true, token: token});
    } catch(err) {
        next(err);
    }
}
