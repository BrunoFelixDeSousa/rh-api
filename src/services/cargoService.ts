/* eslint-disable no-useless-constructor */
// Importa a interface CargoRepositoryInterface, necessária para garantir a conformidade com o contrato definido
import { CargoRepositoryInterface } from '@/interfaces/cargoRepositoryInterface'
// Importa o tipo Cargo do Prisma, que representa a estrutura de dados de um cargo
import { Cargo } from '@prisma/client'

// Define uma interface CargoServiceRequest para representar o formato esperado dos dados ao criar um novo cargo
interface CargoServiceRequest {
  nome_cargo: string
}

// Define uma interface CargoServiceResponse para representar o formato da resposta ao criar um novo cargo
interface CargoServiceResponse {
  cargo: Cargo
}

// Define a classe CargoService para fornecer serviços relacionados a cargos
export class CargoService {
  // Construtor da classe, recebe uma instância de CargoRepositoryInterface para interagir com o banco de dados
  constructor(private cargoRepository: CargoRepositoryInterface) {}

  // Método assíncrono para salvar um novo cargo, recebe dados do tipo CargoServiceRequest e retorna uma Promise com uma resposta do tipo CargoServiceResponse
  async salvarCargo({
    nome_cargo,
  }: CargoServiceRequest): Promise<CargoServiceResponse> {
    // Utiliza o repositório de cargos para criar um novo cargo com o nome fornecido
    const cargo = await this.cargoRepository.create({
      nome_cargo,
    })

    // Retorna a resposta contendo o cargo criado
    return { cargo }
  }

  // Método assíncrono para listar todos os cargos, retorna uma Promise com uma lista de objetos do tipo Cargo
  async listarCargos() {
    // Utiliza o repositório de cargos para obter a lista de todos os cargos
    const cargos = await this.cargoRepository.findAll()

    // Retorna a lista de cargos
    return cargos
  }
}
