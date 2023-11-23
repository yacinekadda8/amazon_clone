// Import MODULES form PACKAGES and assign it to Variables;
const express = require('express');
const bcryptJs = require('bcryptjs');

// Import module from files
const authRouter = express.Router();
const User = require('../models/user'); 

authRouter.post('/api/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;

        // Check if email is badly formatted
        if (!validateEmail(email)) {
            return res.status(400).json({ msg: "Invalid email format" });
        }

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: "This email is already in use" });
        }
        const hashedPassword = await bcryptJs.hash(password,8);

        let user = new User({ name, email, password: (await hashedPassword) });
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Helper function to validate email format
function validateEmail(email) {
    // Add your email validation logic here
    // For a simple check, you can use a regular expression
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}


module.exports=authRouter;