// Importa a biblioteca Fastify para criar uma instância de servidor HTTP
import fastify from 'fastify'

// Importa as rotas configuradas no módulo routes
import { appRoutes } from './router/routes'

// Cria uma instância do servidor Fastify
export const app = fastify()

// Registra as rotas configuradas no aplicativo Fastify
app.register(appRoutes)
