import { Router } from 'express'
import * as ControllerTeste from '../controllers/ControllerTeste'
import * as TurnoController from '../controllers/turnoController'

const mainRouter = Router()

mainRouter.get('/', ControllerTeste.Teste)
mainRouter.post('/usuario', TurnoController.criarUsuario as any)
mainRouter.post('/usuarios/:usuarioId/turnos', TurnoController.criarTurno as any)
mainRouter.post('/turno/:data', TurnoController.buscarTurnoPorData as any)
mainRouter.post('/registro/:turnoId', TurnoController.criarRegistros as any)

export default mainRouter