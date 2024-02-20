// Importa as funções listarCargos e salvarCargo do módulo cargoController
import { listarCargos, salvarCargo } from '@/controllers/cargoController'
// Importa o tipo FastifyInstance para representar a instância do Fastify
import { FastifyInstance } from 'fastify'

// Define a função appRoutes, responsável por configurar as rotas no aplicativo Fastify
export async function appRoutes(app: FastifyInstance) {
  // Configura a rota POST '/cargo', associando-a à função salvarCargo do controller
  app.post('/cargo', salvarCargo)
  // Configura a rota GET '/cargo', associando-a à função listarCargos do controller
  app.get('/cargo', listarCargos)
}
