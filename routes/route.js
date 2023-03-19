const express = require('express');
const router = express.Router() ;
const {
    UserCreate,
    createMovie,
    createOrder,
    createCart,
    getAllMovies,
    getAMovie,
    getOrder,
} = require('../db/db')
router.route('/').get(getAllMovies).post(createMovie)
router.route('/find/').get(getAMovie)
router.route('/createuser/').post(UserCreate)
router.route('/neworder/').post(createOrder).get(getOrder)
router.route('/createcart/').post(createCart)

module.exports = router