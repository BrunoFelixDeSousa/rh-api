// Importa o módulo 'env' do diretório raiz com o alias '@/env'
import { env } from '@/env'
// Importa a classe 'PrismaClient' do pacote '@prisma/client'
import { PrismaClient } from '@prisma/client'

// Configura e exporta uma instância do PrismaClient
export const prisma = new PrismaClient({
  // Configuração do log: Se o ambiente for 'dev', registra apenas eventos de tipo 'query' (consultas ao banco de dados),
  // caso contrário, nenhum log será registrado.
  log: env.NODE_ENV === 'dev' ? ['query'] : [],
})
