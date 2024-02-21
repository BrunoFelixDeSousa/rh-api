import { Area, Prisma } from '@prisma/client'

// Define uma interface chamada AreaRepositoryInterface para representar um repositório de areas
export interface AreaRepositoryInterface {
  // Método para criar um novo nivel, recebendo dados do tipo Prisma.NivelCreateInput e retornando uma Promise com um objeto do tipo Nivel
  create(data: Prisma.AreaCreateInput): Promise<Area>
  // Método para encontrar todos os niveis, retornando uma Promise com uma lista de objetos do tipo Nivel
  findAll(): Promise<Area[]>
}
