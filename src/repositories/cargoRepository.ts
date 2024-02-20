// Importa a interface CargoRepositoryInterface, necessária para garantir a conformidade com o contrato definido
import { CargoRepositoryInterface } from '@/interfaces/cargoRepositoryInterface'
// Importa a instância prisma, que é uma instância do PrismaClient configurada
import { prisma } from '@/lib/prisma'
// Importa tipos relacionados a cargos e operações no Prisma
import { Cargo, Prisma } from '@prisma/client'

// Implementa a classe CargoRepository que segue a interface CargoRepositoryInterface
export class CargoRepository implements CargoRepositoryInterface {
  // Implementação do método create definido pela interface
  async create(data: Prisma.CargoCreateInput) {
    // Utiliza a instância prisma para criar um novo cargo com os dados fornecidos
    const cargo = await prisma.cargo.create({
      data,
    })
    // Retorna o cargo criado
    return cargo
  }

  // Implementação do método findAll definido pela interface
  async findAll(): Promise<Cargo[]> {
    // Utiliza a instância prisma para encontrar todos os cargos existentes
    const cargos = await prisma.cargo.findMany()

    // Retorna a lista de cargos encontrados
    return cargos
  }
}
