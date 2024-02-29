const mongoose = require('mongoose');

const themeSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        maxlength: 63,
    },
    description: {
        type: String,
        required: true,
        maxlength: 255
    }
});

module.exports = mongoose.model('themes', themeSchema);