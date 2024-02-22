// Importa as funções listarCargos e salvarCargo do módulo cargoController
import { listarAreas, salvarArea } from '@/controllers/areaController'
import { listarCargos, salvarCargo } from '@/controllers/cargoController'
import { listarNiveis, salvarNivel } from '@/controllers/nivelController'
// Importa o tipo FastifyInstance para representar a instância do Fastify
import { FastifyInstance } from 'fastify'

// Define a função appRoutes, responsável por configurar as rotas no aplicativo Fastify
export async function appRoutes(app: FastifyInstance) {
  // Configura a rota POST '/cargo', associando-a à função salvarCargo do controller
  app.post('/cargo', salvarCargo)
  // Configura a rota GET '/cargo', associando-a à função listarCargos do controller
  app.get('/cargo', listarCargos)
  // Configura a rota POST '/nivel', associando-a à função salvarNivel do controller
  app.post('/nivel', salvarNivel)
  // Configura a rota GET '/nivel', associando-a à função listarNiveis do controller
  app.get('/nivel', listarNiveis)
  // Configura a rota POST '/area', associando-a à função salvarArea do controller
  app.post('/area', salvarArea)
  // Configura a rota GET '/area', associando-a à função listarAreas do controller
  app.get('/area', listarAreas)
}
