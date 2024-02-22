/* eslint-disable no-useless-constructor */
import { AreaRepositoryInterface } from '@/interfaces/areaRepositoryInterface'
import { Area } from '@prisma/client'

interface AreaServiceRequest {
  nome_area: string
}

interface AreaServiceResponse {
  area: Area
}
export class AreaService {
  constructor(private areaRepository: AreaRepositoryInterface) {}

  async salvarArea({
    nome_area,
  }: AreaServiceRequest): Promise<AreaServiceResponse> {
    const area = await this.areaRepository.create({
      nome_area,
    })

    return { area }
  }

  async listarAreas() {
    return await this.areaRepository.findAll()
  }
}
