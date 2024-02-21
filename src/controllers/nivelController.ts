import { NivelRepository } from '@/repositories/nivelRepository'
import { NivelService } from '@/services/nivelService'
import { FastifyReply, FastifyRequest } from 'fastify'
import { z } from 'zod'

// Função assíncrona para salvar um novo nivel
export async function salvarNivel(
  request: FastifyRequest,
  response: FastifyReply,
) {
  const nivelBodySchema = z.object({
    nome_nivel: z.string(),
  })

  const { nome_nivel } = nivelBodySchema.parse(request.body)

  try {
    const nivelRepository = new NivelRepository()
    const nivelService = new NivelService(nivelRepository)

    await nivelService.salvarNivel({
      nome_nivel,
    })

    return response.send('Nivel criado com sucesso')
  } catch (error) {
    console.error('Erro ao salvar cargo:', error)
    return response.status(500).send('Erro ao salvar cargo')
  }
}

// Função assíncrona para listar todos os cargos
export async function listarCargos(
  request: FastifyRequest,
  response: FastifyReply,
) {
  try {
    const nivelRepository = new NivelRepository()
    const nivelService = new NivelService(nivelRepository)

    const niveis = await nivelService.listarNiveis()
    // Retorna uma resposta HTTP 200 com a lista de cargos
    return response.status(200).send(niveis)
  } catch (error) {
    // Em caso de erro, exibe no console e retorna uma resposta de erro HTTP 500
    console.error('Erro ao buscar niveis:', error)
    return response.status(500).send('Erro ao buscar niveis')
  }
}
