import { Area, Prisma } from '@prisma/client'

// Define uma interface chamada AreaRepositoryInterface para representar um repositório de areas
export interface AreaRepositoryInterface {
  // Método para criar uma nova area, recebendo dados do tipo Prisma.AreaCreateInput e retornando uma Promise com um objeto do tipo Area
  create(data: Prisma.AreaCreateInput): Promise<Area>
  // Método para encontrar todos as areas, retornando uma Promise com uma lista de objetos do tipo Area
  findAll(): Promise<Area[]>
}
