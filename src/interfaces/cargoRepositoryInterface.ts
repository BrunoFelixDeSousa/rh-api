import { Cargo, Prisma } from '@prisma/client'

export interface CargoRepositoryInterface {
  create(data: Prisma.CargoCreateInput): Promise<Cargo>
  findAll(): Promise<Cargo[]>
}
