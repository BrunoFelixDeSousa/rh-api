import { AreaRepository } from '@/repositories/areaRepository'
import { AreaService } from '@/services/areaService'
import { FastifyReply, FastifyRequest } from 'fastify'
import { z } from 'zod'

// Função assíncrona para salvar uma nova area
export async function salvarArea(
  request: FastifyRequest,
  response: FastifyReply,
) {
  // Define um esquema Zod para validar o corpo da requisição
  const areaBodySchema = z.object({
    nome_area: z.string(),
  })
  // Faz a validação do corpo da requisição de acordo com o esquema
  const { nome_area } = areaBodySchema.parse(request.body)

  try {
    const areaRepository = new AreaRepository()
    const areaService = new AreaService(areaRepository)

    await areaService.salvarArea({ nome_area })
  } catch (error) {
    console.error('Erro ao salvar area: ', error)
    return response.status(500).send('Erro ao salvar area')
  }
}

export async function listarAreas(
  request: FastifyRequest,
  response: FastifyReply,
) {
  try {
    const areaRepository = new AreaRepository()
    const areaService = new AreaService(areaRepository)

    const areas = await areaService.listarAreas()
    return response.status(200).send(areas)
  } catch (error) {
    console.error('Erro ao buscar areas:', error)
    return response.status(500).send('Erro ao buscar areas')
  }
}
