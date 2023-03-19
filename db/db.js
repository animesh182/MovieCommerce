const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const UserCreate = async (req,res) =>{
    try{
        var abc = req.query
        var final = abc
        console.log(prisma.user)

        const newUser = await prisma.user.create({ data : final})
        res.status(201).json({msg:newUser})
    }
    catch(error){
        res.status(500).json({msg:error})
    }
}

const createMovie = async (req,res) =>{
    try{
        var abc = req.query
        var keys = Object.keys(abc);
        for(let i=0;i<keys.length;i++){
            var key=keys[i]
            if(key == 'Year' || key == 'quantity' || key =='amount'){
                var parsed = parseInt(abc[key])
                abc[key] = parsed
            }
        }
        var final = abc
        const newMovie = await prisma.movie.create({ data : final})
        res.status(201).json({msg:newMovie})
    }
    catch(error){
        res.status(500).json({msg:error})
    }
}

const createOrder = async (req,res) =>{
    try{
        var abc = req.query
        var final = abc
        const newOrder = await prisma.order.create({ data : final})
        res.status(201).json({msg:newOrder})
    }
    catch(error){
        res.status(500).json({msg:error})
    }
}

const createCart = async (req,res)=>{
    try{
        var abc = req.query
        var keys = Object.keys(abc);
        for(let i=0;i<keys.length;i++){
            var key=keys[i]
            if(key == 'quantity' || key =='amount'){
                var parsed = parseInt(abc[key])
                abc[key] = parsed
            }
        }
        var final = abc
        const newCart = await prisma.cart.create({ data : final})
        res.status(201).json({msg:newCart})
    }
    catch(error){
        res.status(500).json({msg:error})
    }
}

const getAllMovies = async (req,res) =>{
    try{
        const allMovies = await prisma.movie.findMany({})
        if(allMovies.length != 0)
        {
            res.status(200).send(allMovies)
        }
    } 
    catch(error){
        res.status(500).json({msg:error})
    }
}

const getAMovie = async (req,res) =>{
    try{
        var abc = req.query
        var keys = Object.keys(abc);
        if(keys=='id' || keys =='quantity' || keys=='amount'){
            var key = keys[0]
            var value = parseInt(abc[key])
            abc[key] = value
            var final = abc
        }
        else {
            var final = abc
        }
        const filteredmovies = await prisma.movie.findMany({ where: final })
        if(filteredmovies.length != 0)
            {
                res.status(200).send(filteredmovies)
            }
        else{
            res.status(404).send("Couldn't find any movies with that filter")
        }
    }
    catch(error){
        res.status(500).json({msg:error})
    }
}
const getOrder = async (req,res) =>{
    try{
        var abc = req.query
        var keys = Object.keys(abc);
        if(keys=='id' || keys =='quantity' || keys=='amount'){
            var key = keys[0]
            var value = parseInt(abc[key])
            abc[key] = value
            var final = abc
        }
        else {
            var final = abc
        }
        const filteredorder = await prisma.order.findMany({ where: final })
        if(filteredorder.length != 0)
            {
                res.status(200).send(filteredorder)
            }
        else{
            res.status(404).send("Couldn't find any movies with that filter")
        }
    }
    catch(error){
        res.status(500).json({msg:error})
    }
}

module.exports = {
    UserCreate,
    createMovie,
    createOrder,
    createCart,
    getAMovie,
    getOrder,
    getAllMovies,
}
