// Import MODULES form PACKAGES and assign it to Variables;
const express = require('express');
const mongoose = require('mongoose');
const dotenv = require("dotenv");
// Import module from files
const authRouter = require('./routes/auth');

dotenv.config();
// Set variables - Create instances
const MONGODB_URI = process.env.MONGODB_URI ;
const  PORT  = process.env.PORT || 8000;
const app = express();
// Use middlewares
app.use(express.json());
app.use(authRouter);

//Connect to MongoDB
mongoose.connect(MONGODB_URI).then(()=>{
    console.log('Succsessfully Connected to MongoDB')
}).catch(e=>{
    console.log(`Connected to MongoDB Failed ${e}`)

})
// Start the express application and listen on the specified port and IP address
app.listen(PORT, "0.0.0.0",() => {
    // Log a message when the server is successfully connected
    console.log(`Server is running in ${process.env.NODE_ENV}, Connected to port: ${PORT}`);
});
