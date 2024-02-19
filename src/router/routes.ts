import { listarCargos, salvarCargo } from '@/controllers/cargoController'
import { FastifyInstance } from 'fastify'

export async function appRoutes(app: FastifyInstance) {
  app.post('/cargo', salvarCargo)
  app.get('/cargo', listarCargos)
}
