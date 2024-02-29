const express = require('express');
const router = express.Router();
const Question = require('../models/question');

// Création d'une question
router.post('/', async (req, res) => {
    const question = new Question({
        theme: req.body.theme,
        question: req.body.question,
        answer: req.body.answer,
        options: req.body.options
    });

    try {
        const newQuestion = await question.save();
        res.status(201).json(newQuestion);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

// Récupération de toutes les questions
router.get('/', async (req, res) => {
    try {
        const questions = await Question.find();
        res.json(questions);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});     

// Récupération d'une question par son id   
router.get('/:questionid', async (req, res) => {
    try {
        const question = await Question.findById(req.params.questionid);
        if(question == null){
            return res.status(404).json({ message: 'Question not found' });
        }
        res.status(200).json(question);
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
});

// Suppression d'une question par son id
router.delete('/:questionid', async (req, res) => {
    try {
        const question = await Question.findByIdAndDelete(req.params.questionid);
        if(question == null){
            return res.status(404).json({ message: 'Question not found' });
        }
        res.status(200).json({ message: 'Question deleted successfully' });
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
});

// Modification d'une question par son id
router.put('/:questionid', async (req, res) => {
    try {
        const question = await Question.findByIdAndUpdate(req.params.questionid, req.body, { new: true });
        if(question == null){
            return res.status(404).json({ message: 'Question not found' });
        }
        res.status(200).json(question);
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
});

module.exports = router;