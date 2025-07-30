import { Router } from 'express'
import * as ControllerTeste from '../controllers/ControllerTeste'

const mainRouter = Router()

mainRouter.get('/', ControllerTeste.Teste)

export default mainRouter