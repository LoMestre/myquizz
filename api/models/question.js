const mongoose = require('mongoose');

const QuestionSchema = new mongoose.Schema({
    theme :{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'themes',
        required: true
    },
    question: {
        type: String,
        required: true,
        maxlength: 255,
    },
    answer: {
        type: String,
        required: true,
        maxlength: 255,
    },
    options: [{
        type: String,
        required: true,
        maxlength: 255,
    }]
});

module.exports = mongoose.model('questions', QuestionSchema);