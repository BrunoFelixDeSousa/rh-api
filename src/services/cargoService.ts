/* eslint-disable no-useless-constructor */
import { CargoRepositoryInterface } from '@/interfaces/cargoRepositoryInterface'
import { Cargo } from '@prisma/client'

interface CargoServiceRequest {
  nome_cargo: string
}

interface CargoServiceResponse {
  cargo: Cargo
}

export class CargoService {
  constructor(private cargoRepository: CargoRepositoryInterface) {}

  async salvarCargo({
    nome_cargo,
  }: CargoServiceRequest): Promise<CargoServiceResponse> {
    const cargo = await this.cargoRepository.create({
      nome_cargo,
    })

    return { cargo }
  }

  async listarCargos() {
    const cargos = await this.cargoRepository.findAll()

    return cargos
  }
}
