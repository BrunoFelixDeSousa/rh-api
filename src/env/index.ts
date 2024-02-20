import 'dotenv/config'
import { z } from 'zod'

// Define um esquema Zod para validar e definir valores padrão para as variáveis de ambiente
const envSchema = z.object({
  NODE_ENV: z.enum(['dev', 'test', 'production']).default('dev'),
  // coerce do Zod garante conversão para número, caso a variável ambiente seja do tipo string
  PORT: z.coerce.number().default(3333),
})

// Tenta realizar o parsing seguro das variáveis de ambiente usando o esquema definido
const _env = envSchema.safeParse(process.env)

// Verifica se o parsing foi bem-sucedido
if (_env.success === false) {
  // Em caso de falha, exibe no console uma mensagem de erro com detalhes e lança uma exceção
  console.log('❌ Invalid environment variables', _env.error.format())
  throw new Error('Invalid environment variables')
}

// Exporta as variáveis de ambiente validadas e com valores padrão
export const env = _env.data
