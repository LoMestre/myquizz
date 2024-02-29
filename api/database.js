const mongoose = require('mongoose');

/**
 * Connecte à la base de données MongoDB.
 * @returns {Promise<void>} Une promesse qui se résout lorsque la base de données est connectée avec succès.
 */
const connectDB = async () => {
    try{
        await mongoose.connect('mongodb://localhost:27017/myquizz');
        console.log('Database connected successfully');
    } catch(error){
        console.log('Error connecting to the database');
        process.exit(1);
    }
};

module.exports = connectDB;