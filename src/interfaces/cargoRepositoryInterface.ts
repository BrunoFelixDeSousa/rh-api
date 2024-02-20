// Importa as definições de tipos relacionados a cargos e operações no Prisma
import { Cargo, Prisma } from '@prisma/client'

// Define uma interface chamada CargoRepositoryInterface para representar um repositório de cargos
export interface CargoRepositoryInterface {
  // Método para criar um novo cargo, recebendo dados do tipo Prisma.CargoCreateInput e retornando uma Promise com um objeto do tipo Cargo
  create(data: Prisma.CargoCreateInput): Promise<Cargo>
  // Método para encontrar todos os cargos, retornando uma Promise com uma lista de objetos do tipo Cargo
  findAll(): Promise<Cargo[]>
}
