## Estrutura do Projeto

### Inicialização do Projeto

1. **npm init -y**
    - Inicializa um novo projeto Node.js com um arquivo `package.json` padrão.
2. **.npmrc**
    - Cria o arquivo `.npmrc` para travar versões de dependências.
    - Utiliza `save-exact=true` para travar a versão.

### Configuração do TypeScript

1. **npm i typescript @types/node tsx tsup -D**
    - Instala o TypeScript para fornecer informações de tipagem para bibliotecas nativas do Node.js.
    - Permite compilar e rodar o Node sem a necessidade de conversão de arquivos.
    - Facilita a transpilação e construção de projetos TypeScript para JavaScript.
2. **npx tsc --init**
    - Cria um arquivo de configuração `tsconfig.json`.

### Instalação de Frameworks e Ferramentas

1. **npm i fastify**
    - Instala o Fastify, um framework web leve e eficiente para construção de aplicativos e APIs em Node.js.
2. **npm i dotenv**
    - Instala o dotenv para carregar variáveis de ambiente.
3. **npm i zod**
    - Instala o Zod para validação.
4. **npm i eslint @rocketseat/eslint-config -D**
    - Instala o ESLint com padrões de projeto usados pela Rocketseat.
    
    Cria um arquivo `.eslintrc.json` com:
    
    ```json
    {
        "extends": [
            "@rocketseat/eslint-config/node"
        ]
    }
    
    ```
    
    !https://prod-files-secure.s3.us-west-2.amazonaws.com/0096bacb-d8b8-4b74-bf0b-2e0f094bf780/315b8a9a-4cc8-4928-bd0c-c982cd75d0b3/Untitled.png
    
    Ou, para criar um padrão novo:
    
    ```bash
    npm i eslint -D
    npx eslint --init
    
    ```
    

### Estrutura de Pastas e Arquivos

!https://prod-files-secure.s3.us-west-2.amazonaws.com/0096bacb-d8b8-4b74-bf0b-2e0f094bf780/67317170-0787-4e83-8b46-f3603e549c4a/Untitled.png

!https://prod-files-secure.s3.us-west-2.amazonaws.com/0096bacb-d8b8-4b74-bf0b-2e0f094bf780/8c8218b5-3859-406a-86e2-312a576af7e2/Untitled.png

### Integração com Prisma ORM

1. **npm i prisma -D**
    - Instala o Prisma ORM.
2. **npx prisma init**
    - Inicializa a conexão com o banco de dados, gerando a pasta `prisma/schema.prisma`.
3. **npm i @prisma/client**
    - Instala a dependência para acessar o banco de dados.
4. **npx prisma generate**
    - Gera o código TypeScript associado ao esquema de banco de dados definido no Prisma.
5. **npx prisma migrate dev**
    - Gerencia as migrações de banco de dados em aplicativos Node.js e TypeScript.
6. **npx prisma studio**
    - Cria uma interface para navegar entre as tabelas.

### Docker - Postgres

1. **Docker Run para PostgreSQL:**
    
    ```bash
    docker run --name api-solid-pg -e POSTGRESQL_USERNAME=docker -e POSTGRESQL_PASSWORD=docker -e POSTGRESQL_DATABASE=apisolid -p 5432:5432 -d -t bitnami/postgresql
    
    ```
    

---

Espero que essa revisão ajude a tornar sua documentação mais clara e fácil de seguir.