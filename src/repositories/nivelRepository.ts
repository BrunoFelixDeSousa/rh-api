// Importa a interface NivelRepositoryInterface, necessária para garantir a conformidade com o contrato definido
import { NivelRepositoryInterface } from '@/interfaces/nivelRepositoryInterface'
import { prisma } from '@/lib/prisma'
import { Nivel, Prisma } from '@prisma/client'

export class NivelRepository implements NivelRepositoryInterface {
  // Implementação do método create definido pela interface
  async create(data: Prisma.NivelCreateInput) {
    const nivel = await prisma.nivel.create({
      data,
    })
    return nivel
  }

  // Implementação do método findAll definido pela interface
  async findAll(): Promise<Nivel[]> {
    const niveis = await prisma.nivel.findMany()

    return niveis
  }
}
