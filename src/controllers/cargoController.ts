import { CargoRepository } from '@/repositories/cargoRepository'
import { CargoService } from '@/services/cargoService'
import { FastifyReply, FastifyRequest } from 'fastify'
import { z } from 'zod'

export async function salvarCargo(
  request: FastifyRequest,
  response: FastifyReply,
) {
  const cargoBodySchema = z.object({
    nome_cargo: z.string(),
  })

  const { nome_cargo } = cargoBodySchema.parse(request.body)
  console.log(nome_cargo)

  try {
    const cargoRepository = new CargoRepository()
    const cargoService = new CargoService(cargoRepository)

    await cargoService.salvarCargo({
      nome_cargo,
    })
  } catch (error) {
    console.error('Erro ao salvar cargo:', error)
    return response.status(500).send('Erro ao salvar cargo')
  }
}

export async function listarCargos(
  request: FastifyRequest,
  response: FastifyReply,
) {
  try {
    const cargoRepository = new CargoRepository()
    const cargoService = new CargoService(cargoRepository)
    const cargos = await cargoService.listarCargos()
    return response.status(200).send(cargos)
  } catch (error) {
    console.error('Erro ao buscar cargos:', error)
    return response.status(500).send('Erro ao buscar cargos')
  }
}
