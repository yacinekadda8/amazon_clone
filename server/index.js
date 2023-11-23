// Import MODULES form PACKAGES and assign it to Variables;
const express = require('express');
const mongoose = require('mongoose')

// Import module from files
const authRouter = require('./routes/auth');

// Set variables - Create instances
const PORT = 3000;
const app = express();
const dbUrl = "mongodb+srv://yaxine:yaxine1312@cluster0.wopq9en.mongodb.net/?retryWrites=true&w=majority";

// Use middlewares
app.use(express.json());
app.use(authRouter);

//Connect to MongoDB
mongoose.connect(dbUrl).then(()=>{
    console.log('Succsessfully Connected to MongoDB')
}).catch(e=>{
    console.log(`Connected to MongoDB Failed ${e}`)

})
// Start the express application and listen on the specified port and IP address
app.listen(PORT, "0.0.0.0",() => {
    // Log a message when the server is successfully connected
    console.log(`Connected to port: ${PORT}`);
});
