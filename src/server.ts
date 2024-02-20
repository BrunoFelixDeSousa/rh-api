import { app } from './app'
import { env } from './env'

// Inicia o servidor e o faz escutar em um endereço e porta específicos
app
  .listen({
    host: '0.0.0.0', // Define o host como '0.0.0.0' para escutar em todas as interfaces de rede
    port: env.PORT, // Utiliza a porta especificada nas variáveis de ambiente
  })
  .then(() => {
    console.log('🚀 HTTP Serve Running') // Exibe uma mensagem indicando que o servidor está em execução
  })
