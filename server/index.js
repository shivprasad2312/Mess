const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://shivprasadrahulwad:Rshivam%401234@cluster.0i4ldib.mongodb.net/?retryWrites=true&w=majority&appName=Cluster";

app.use(express.json());

// Adjust the path to the adminMiddleware if needed
// const adminMiddleware = require('./middlewares/admin');

// Use the middleware for the adminRouter
// app.use('/admin', adminMiddleware, adminRouter);

app.use(authRouter);
app.use(adminRouter);

mongoose.connect(DB).then(() => {
    console.log("Connection successful");
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected Port ${PORT}`);
});
