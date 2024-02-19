-- CreateTable
CREATE TABLE "cargo" (
    "id" SERIAL NOT NULL,
    "nome_cargo" TEXT NOT NULL,

    CONSTRAINT "cargo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "nivel" (
    "id" SERIAL NOT NULL,
    "nome_nivel" TEXT NOT NULL,

    CONSTRAINT "nivel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "area" (
    "id" SERIAL NOT NULL,
    "nome_area" TEXT NOT NULL,

    CONSTRAINT "area_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "funcionario" (
    "id" SERIAL NOT NULL,
    "nome_completo" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "endereco" TEXT NOT NULL,
    "data_contratacao" TIMESTAMP(3) NOT NULL,
    "data_demissao" TIMESTAMP(3) NOT NULL,
    "salario_base" DOUBLE PRECISION NOT NULL,
    "impostos" DOUBLE PRECISION NOT NULL,
    "beneficios" DOUBLE PRECISION NOT NULL,
    "VT" DOUBLE PRECISION NOT NULL,
    "VR" DOUBLE PRECISION NOT NULL,
    "salario_total" DOUBLE PRECISION NOT NULL,
    "Cargo_ID" INTEGER NOT NULL,
    "Nivel_ID" INTEGER NOT NULL,
    "Area_ID" INTEGER NOT NULL,

    CONSTRAINT "funcionario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tempo_empresa" (
    "id" SERIAL NOT NULL,
    "funcionario_id" INTEGER NOT NULL,
    "tempo_empresa" INTEGER NOT NULL,
    "faixa_tempo" TEXT NOT NULL,
    "ferias_acumuladas" INTEGER NOT NULL,
    "horas_extras" INTEGER NOT NULL,

    CONSTRAINT "tempo_empresa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "avaliacao_funcionario" (
    "id" SERIAL NOT NULL,
    "funcionario_id" INTEGER NOT NULL,
    "trabalho_equipe" INTEGER NOT NULL,
    "lideranca" INTEGER NOT NULL,
    "comunicacao" INTEGER NOT NULL,
    "iniciativa" INTEGER NOT NULL,
    "organizacao" INTEGER NOT NULL,

    CONSTRAINT "avaliacao_funcionario_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "funcionario_Cargo_ID_fkey" FOREIGN KEY ("Cargo_ID") REFERENCES "cargo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "funcionario_Nivel_ID_fkey" FOREIGN KEY ("Nivel_ID") REFERENCES "nivel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "funcionario_Area_ID_fkey" FOREIGN KEY ("Area_ID") REFERENCES "area"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tempo_empresa" ADD CONSTRAINT "tempo_empresa_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "avaliacao_funcionario" ADD CONSTRAINT "avaliacao_funcionario_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
