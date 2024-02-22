import { AreaRepositoryInterface } from '@/interfaces/areaRepositoryInterface'
import { prisma } from '@/lib/prisma'
import { Area, Prisma } from '@prisma/client'

// Implementa a classe AreaRepository que segue a interface AreaRepositoryInterface
export class AreaRepository implements AreaRepositoryInterface {
  // Implementação do método create definido pela interface
  async create(data: Prisma.AreaCreateInput) {
    // Utiliza a instância prisma para criar uma nova area com os dados fornecidos
    const area = await prisma.area.create({
      data,
    })
    // Retorna a area criado
    return area
  }

  // Implementação do método findAll definido pela interface
  async findAll(): Promise<Area[]> {
    // Utiliza a instância prisma para encontrar todas as areas existentes
    return await prisma.area.findMany()
  }
}
