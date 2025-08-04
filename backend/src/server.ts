import express from 'express'
import path from 'path'
import dotenv from 'dotenv'
import cors from 'cors'
import mainRouter from './routes'


dotenv.config()
const server = express()

server.use(express.json())
server.use(express.urlencoded({extended: true}))
server.use(cors())
server.use(mainRouter)

server.listen(process.env.PORT, () => {
    console.log('Servidor rodando... http://localhost:' + process.env.PORT)
})