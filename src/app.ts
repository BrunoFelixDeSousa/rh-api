import fastify from 'fastify'
import { appRoutes } from './router/routes'

export const app = fastify()

app.register(appRoutes)
