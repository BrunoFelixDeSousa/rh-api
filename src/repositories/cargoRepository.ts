import { CargoRepositoryInterface } from '@/interfaces/cargoRepositoryInterface'
import { prisma } from '@/lib/prisma'
import { Cargo, Prisma } from '@prisma/client'

export class CargoRepository implements CargoRepositoryInterface {
  async create(data: Prisma.CargoCreateInput) {
    const cargo = await prisma.cargo.create({
      data,
    })

    return cargo
  }

  async findAll(): Promise<Cargo[]> {
    const cargos = await prisma.cargo.findMany()
    return cargos
  }
}
