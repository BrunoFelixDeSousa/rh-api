// Importa as definições de tipos relacionados a niveis e operações no Prisma
import { Nivel, Prisma } from '@prisma/client'

// Define uma interface chamada NivelRepositoryInterface para representar um repositório de niveis
export interface NivelRepositoryInterface {
  // Método para criar um novo nivel, recebendo dados do tipo Prisma.NivelCreateInput e retornando uma Promise com um objeto do tipo Nivel
  create(data: Prisma.NivelCreateInput): Promise<Nivel>
  // Método para encontrar todos os niveis, retornando uma Promise com uma lista de objetos do tipo Nivel
  findAll(): Promise<Nivel[]>
}
