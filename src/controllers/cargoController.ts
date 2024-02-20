import { CargoRepository } from '@/repositories/cargoRepository'
import { CargoService } from '@/services/cargoService'
// Importa tipos Fastify para manipulação de requisição e resposta HTTP
import { FastifyReply, FastifyRequest } from 'fastify'
// Importa a biblioteca Zod para validação de esquemas
import { z } from 'zod'

// Função assíncrona para salvar um novo cargo
export async function salvarCargo(
  request: FastifyRequest,
  response: FastifyReply,
) {
  // Define um esquema Zod para validar o corpo da requisição
  const cargoBodySchema = z.object({
    nome_cargo: z.string(),
  })

  // Faz a validação do corpo da requisição de acordo com o esquema
  const { nome_cargo } = cargoBodySchema.parse(request.body)

  try {
    // Instancia um repository de cargo
    const cargoRepository = new CargoRepository()
    // Instancia um service de cargo, passando o repositório como parâmetro, criando uma injeção de dependê ncia.
    const cargoService = new CargoService(cargoRepository)

    // Chama o método salvarCargo do service, passando o nome do cargo extraído
    await cargoService.salvarCargo({
      nome_cargo,
    })
  } catch (error) {
    // Em caso de erro, exibe no console e retorna uma resposta de erro HTTP 500
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
    // Instancia um repository de cargo
    const cargoRepository = new CargoRepository()
    // Instancia um service de cargo, passando o repositório como parâmetro, criando uma injeção de dependê ncia.
    const cargoService = new CargoService(cargoRepository)
    // Chama o método listarCargos do service para obter a lista de cargos
    const cargos = await cargoService.listarCargos()
    // Retorna uma resposta HTTP 200 com a lista de cargos
    return response.status(200).send(cargos)
  } catch (error) {
    // Em caso de erro, exibe no console e retorna uma resposta de erro HTTP 500
    console.error('Erro ao buscar cargos:', error)
    return response.status(500).send('Erro ao buscar cargos')
  }
}
