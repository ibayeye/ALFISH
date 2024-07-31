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
