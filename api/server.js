const express = require('express');
const connectDB = require('./database');
const themeRouter = require('./routes/theme');
const questionsRouter = require('./routes/questions'); 

const app = express();

// Connect to the database
connectDB();

// Middleware
app.use(express.json());

// Routes
app.use('/themes', themeRouter);
app.use('/questions', questionsRouter);


app.listen(3000, () => {
  console.log('Server is running on port 3000');
});