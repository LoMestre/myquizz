const express = require('express');
const router = express.Router();
const Theme = require('../models/theme');

/**
 * Récupère tous les thèmes.
 */
router.get('/', async (req, res) => {
    try {
        const themes = await Theme.find();
        res.json(themes);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

/**
 * Créer un nouveau thème.
 */
router.post('/', async (req, res) => {
    const theme = new Theme({
        name: req.body.name,
        description: req.body.description
    });

    try {
        const newTheme = await theme.save();
        res.status(201).json(newTheme);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

/**
 * Récupère un thème par son id.
 */
router.get('/:themeid', async(req, res) => {
    try {
        const theme = await Theme.findById(req.params.themeid);
        if(theme == null){
            return res.status(404).json({ message: 'Theme not found' });
        }
        res.status(200).json(theme);
    } catch(error){
        return res.status(500).json({ message: error.message });
    }
});

/**
 * Supprime un thème par son id.
 */
router.get('/:themeid', async(req, res) => {
    try{
        const theme = await Theme.findByIdAndDelete(req.params.themeid);
        if(theme == null){
            return res.status(404).json({ message: 'Theme not found' });
        }
        res.status(200).json({ message: 'Theme deleted successfully' });
    }
    catch(error){
        return res.status(500).json({ message: error.message });
    }
});

/**
 * Met à jour un thème par son id.
 */
router.patch('/:themeid', async(req, res) => {
    try{
        const theme = await Theme.findByIdAndUpdate(req.params.themeid, {
            name: req.body.name,
            description: req.body.description
        }, { new: true });
        if(theme == null){
            return res.status(404).json({ message: 'Theme not found' });
        }
        res.status(200).json(theme);
    }
    catch(error){
        return res.status(500).json({ message: error.message });
    }
});


module.exports = router;