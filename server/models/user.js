const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    name:{
        required: true,
        type: String,
        trim: true,
    },
    email:{
        required: true,
        type: String,
        trim: true,
        unique: true,
        lowercase: true,
    },
    password: {
        type: String,
        required: true
      },
    address: {
        type: String,
        default: ''
      },
    type : {
        type: String,
        default: 'user'
      },
    // cart
})

const User = mongoose.model('User',userSchema);
module.exports = User;