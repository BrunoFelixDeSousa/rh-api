/* eslint-disable no-useless-constructor */

import { NivelRepositoryInterface } from '@/interfaces/nivelRepositoryInterface'
import { Nivel } from '@prisma/client'

// Define uma interface NivelServiceRequest para representar o formato esperado dos dados ao criar um novo nivel
interface NivelServiceRequest {
  nome_nivel: string
}

// Define uma interface NivelServiceResponse para representar o formato da resposta ao criar um novo cargo
interface NivelServiceResponse {
  nivel: Nivel
}

// Define a classe NivelService para fornecer serviços relacionados a niveis
export class NivelService {
  // criando uma injeção de dependencias
  constructor(private nivelRepository: NivelRepositoryInterface) {}

  // Método assíncrono para salvar um novo nivel, recebe dados do tipo NivelServiceRequest e retorna uma Promise com uma resposta do tipo NivelServiceResponse
  async salvarNivel({
    nome_nivel,
  }: NivelServiceRequest): Promise<NivelServiceResponse> {
    const nivel = await this.nivelRepository.create({
      nome_nivel,
    })

    return { nivel }
  }

  // Método assíncrono para listar todos os niveis, retorna uma Promise com uma lista de objetos do tipo Nivel
  async listarNiveis() {
    const niveis = await this.nivelRepository.findAll()
    return niveis
  }
}
