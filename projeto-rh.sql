CREATE TABLE cargo (
    id SERIAL PRIMARY KEY,
    nome_cargo VARCHAR(255)
);

CREATE TABLE nivel (
    id SERIAL PRIMARY KEY,
    nome_nivel VARCHAR(255)
);

CREATE TABLE area (
    id SERIAL PRIMARY KEY,
    nome_area VARCHAR(255)
);

CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome_completo VARCHAR(255),
    sexo VARCHAR(1),
    data_nascimento DATE,
    endereco VARCHAR(255),
    data_contratacao DATE,
    data_demissao DATE,
    salario_base NUMERIC(10, 2),
    impostos NUMERIC(10,2),
    beneficios NUMERIC(10,2),
    VT NUMERIC(10, 2),
    VR NUMERIC(10, 2),
    salario_total NUMERIC(10, 2),
    Cargo_ID INTEGER REFERENCES cargo(id),
    Nivel_ID INTEGER REFERENCES nivel(id),
    Area_ID INTEGER REFERENCES area(id)
);
-- select * from funcionario;
-- ALTER TABLE funcionario
-- ALTER COLUMN beneficios TYPE NUMERIC(10,2)
-- USING beneficios::numeric(10,2);
-- ALTER TABLE funcionario
-- ALTER COLUMN impostos TYPE NUMERIC(10,2)

CREATE TABLE tempo_empresa (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER REFERENCES Funcionario(id),
    tempo_empresa INTEGER,
    faixa_tempo VARCHAR(255),
    ferias_acumuladas INTEGER,
    horas_extras INTEGER
);

CREATE TABLE avaliacao_funcionario (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER REFERENCES Funcionario(id),
    trabalho_equipe INTEGER,
    lideranca INTEGER,
    comunicacao INTEGER,
    iniciativa INTEGER,
    organizacao INTEGER
);

-- Inserir dados na tabela Cargo
INSERT INTO cargo
	(nome_cargo) 
VALUES 
    ('Coordenador'),
    ('Estagiário'),
    ('Analista'),
    ('Gerente');
	
select * from cargo;

-- Inserir dados na tabela Nivel
INSERT INTO nivel 
	(nome_nivel)
VALUES
    ('FIIII'),
    ('ADI'),
    ('FII'),
    ('LOI'),
    ('ADIII'),
    ('LOIII'),
    ('ADII'),
    ('FIIV'),
    ('FIII'),
    ('LOII');

select * from nivel

-- Inserir dados na tabela Area
INSERT INTO area 
	(nome_area) 
VALUES
    ('Financeiro'),
    ('Administrativo'),
    ('Logística');
	
select * from area

-- Inserir dados na tabela Funcionario
INSERT INTO funcionario (
    nome_completo, sexo, data_nascimento, endereco, data_contratacao, data_demissao, 
    salario_base, impostos, beneficios, VT, VR, salario_total, Cargo_ID, Nivel_ID, Area_ID
) VALUES
    ('Bárbara Rodrigues', 'F', '1999-03-14', 'R. Luíz Faccini, 212 - Centro, Guarulhos - SP, 07110-000', '2017-03-09', NULL,
    11589.00, 863.73, 1343.58, 959.70, 1151.64, 15907.65, 1, 1, 1),
    ('Bárbara Spenchutt Vieira', 'F', '1997-09-30', 'R. Brasílio Itiberê, 3279 - Água Verde, Curitiba - PR, 80250-160', '2017-06-20', NULL,
    1795.00, 179.50, 53.85, 179.50, 215.40, 2423.25, 2, 2, 2),
    ('Camila Regis Ivo', 'F', '1992-07-01', 'R. Teodoro Sampaio, 954 - Pinheiros, São Paulo - SP, 05406-050', '2016-01-18', '2017-12-18',
    1599.00, 47.97, 47.97, 159.90, 191.88, 2046.72, 1, 2, 1),
    ('Gabriela e Alves', 'F', '1999-05-09', 'Av. Barão Homem de Melo, 1389 - Nova Granada, Belo Horizonte - MG, 30431-425', '2017-05-04', NULL,
    1797.00, 125.79, 233.61, 179.70, 215.64, 2551.74, 1, 2, 1),
    ('Guilherme Lopes da Silveira', 'M', '1999-11-30', 'R. Visc. de Pirajá, 136 - Ipanema, Rio de Janeiro - RJ, 22410-000', '2018-04-12', NULL,
    1269.00, 101.52, 164.97, 126.90, 152.28, 1814.67, 2, 2, 3),
    ('Jeferson Ramos', 'M', '1995-05-07', 'Rua Quinze de Novembro, 8 - Loja 301a Loja 301b - Centro, Niterói - RJ, 24020-125', '2013-05-02', NULL,
    11382.00, 213.62, 1281.72, 1068.10, 1281.72, 15227.16, 3, 1, 2),
    ('Jéssica de Morais Silva', 'F', '1979-09-16', 'Shopping Barra - Av. Centenário, 2992 - Barra, Salvador - BA, 40155-150', '2014-11-05', '2016-10-05',
    11518.00, 436.95, 1310.85, 873.90, 1048.68, 15188.38, 1, 3, 3),
    ('João Monteiro', 'M', '1988-04-26', 'Av. Goiás Norte, 3.592 - quadra 2.1 - St. Mal. Rondon, Goiânia - GO, 74063-010', '2013-06-20', NULL,
    7505.00, 652.40, 848.12, 652.40, 782.88, 10440.80, 2, 3, 2),
    ('João Resinente', 'M', '1996-09-15', 'Av. Goiás Norte, 3.592 - quadra 2.1 - St. Mal. Rondon, Goiânia - GO, 74063-010', '2014-09-11', NULL,
    7632.00, 434.21, 868.42, 620.30, 744.36, 10299.29, 2, 3, 2),
    ('José do Vale Lisboa', 'M', '1989-11-18', 'Rua Antônio Lumack do Monte, 203 - 1 - Boa Viagem, Recife - PE, 51020-350', '2013-01-05', NULL,
    10661.00, 754.96, 660.59, 943.70, 1132.44, 14152.69, 1, 1, 1),
    ('Juan Fernandes de Araújo', 'M', '1978-01-19', 'Av. Dom Luís, 500 - Aldeota, Fortaleza - CE, 60160-230', '2016-09-01', NULL,
    6256.00, 476.10, 618.93, 476.10, 571.32, 8398.45, 2, 2, 3),
    ('Julia Freitas', 'F', '1996-09-27', 'Av. Mal. Floriano Peixoto, 2248-2258 - Centro, Nova Iguaçu - RJ, 26210-000', '2014-09-23', NULL,
    959.00, 28.77, 47.95, 95.90, 115.08, 1246.70, 3, 2, 3),
    ('Lígia Fernandes Filardi', 'F', '1995-12-19', 'Av. Dom Luís, 500 - Aldeota, Fortaleza - CE, 60160-230', '2013-12-14', NULL,
    965.00, 48.25, 96.50, 96.50, 115.80, 1322.05, 1, 2, 1),
    ('Lucas Luca Lima Barbosa', 'M', '1995-09-18', 'Av. Borges de Medeiros, 3120 - Praia de Belas, Porto Alegre - RS, 90110-150', '2013-09-13', NULL,
    978.00, 48.90, 78.24, 97.80, 117.36, 1320.30, 1, 2, 1),
    ('Luize da Costa', 'F', '1980-11-28', 'R. Visc. de Pirajá, 136 - Ipanema, Rio de Janeiro - RJ, 22410-000', '2013-01-12', '2014-12-13',
    10000.00, 592.76, 931.48, 846.80, 1016.16, 13387.20, 3, 1, 2),
    ('Manuela Abreu Braga Martins', 'F', '1984-11-03', 'Av. Borges de Medeiros, 3120 - Praia de Belas, Porto Alegre - RS, 90110-150', '2013-03-10', NULL,
    16466.00, 1023.26, 1607.98, 1461.80, 1754.16, 22313.20, 4, 4, 1),
    ('Mariana Schwenck Gullo', 'F', '1995-02-19', 'Av. Barão Homem de Melo, 1389 - Nova Granada, Belo Horizonte - MG, 30431-425', '2013-02-14', NULL,
    14887.00, 1072.88, 1341.10, 1341.10, 1609.32, 20251.40, 4, 4, 1),
    ('Marianna Pereira da Silva', 'F', '1997-10-06', 'Rua Quinze de Novembro, 8 - Loja 301a Loja 301b - Centro, Niterói - RJ, 24020-125', '2015-10-02', NULL,
    1301.00, 65.05, 182.14, 130.10, 156.12, 1834.41, 1, 2, 1),
    ('Matheus Matta Marques', 'M', '1988-01-09', 'Shopping Barra - Av. Centenário, 2992 - Barra, Salvador - BA, 40155-150', '2013-09-09', NULL,
    6103.00, 385.70, 165.30, 551.00, 661.20, 7866.20, 2, 3, 2),
    ('Matheus Rubio', 'M', '1996-01-20', 'R. Dr. Antônio Castro Prado, 422 - Vila Rossi e Borchi, Campinas - SP, 13076-130', '2014-01-15', '2015-12-16',
    1924.00, 134.68, 192.40, 192.40, 230.88, 2674.36, 2, 2, 3),
    ('Matheus Sepúlveda', 'M', '1984-01-01', 'R. Teodoro Sampaio, 954 - Pinheiros, São Paulo - SP, 05406-050', '2013-06-01', NULL,
    940.00, 94.00, 122.20, 94.00, 112.80, 1363.00, 2, 2, 2),
    ('Milena Brum', 'F', '1997-02-12', 'Rua Antônio Lumack do Monte, 203 - 1 - Boa Viagem, Recife - PE, 51020-350', '2015-02-08', NULL,
    6286.00, 351.26, 602.16, 501.80, 602.16, 8343.38, 2, 3, 2),
    ('Nathalia Bach', 'F', '1978-10-12', 'Av. Dom Luís, 500 - Aldeota, Fortaleza - CE, 60160-230', '2015-09-22', NULL,
    7448.00, 391.79, 223.88, 559.70, 671.64, 9295.01, 4, 3, 1),
    ('Pedro Jardim', 'M', '1992-03-08', 'R. Visc. de Pirajá, 136 - Ipanema, Rio de Janeiro - RJ, 22410-000', '2015-01-12', '2016-12-12',
    10804.00, 828.80, 1243.20, 1036.00, 1243.20, 15155.20, 3, 2, 2),
    ('Priscila de Oliveira', 'F', '1997-06-12', 'Rua Quinze de Novembro, 8 - Loja 301a Loja 301b - Centro, Niterói - RJ, 24020-125', '2015-06-08', NULL,
    5781.00, 295.56, 262.72, 328.40, 394.08, 7061.76, 4, 3, 1),
    ('Rafael Hollander', 'M', '1998-08-24', 'Rua Quinze de Novembro, 8 - Loja 301a Loja 301b - Centro, Niterói - RJ, 24020-125', '2016-08-19', NULL,
    3860.00, 175.38, 292.30, 292.30, 350.76, 4970.74, 4, 3, 1),
    ('Rafael Oliveira Leite Silva', 'M', '1999-12-13', 'Av. Barão Homem de Melo, 1389 - Nova Granada, Belo Horizonte - MG, 30431-425', '2018-12-08', NULL,
    11566.00, 624.54, 624.54, 1040.90, 1249.08, 15105.06, 3, 2, 3),
    ('Raíza Barbosa', 'F', '1994-05-26', 'Rua Antônio Lumack do Monte, 203 - 1 - Boa Viagem, Recife - PE, 51020-350', '2017-01-27', '2018-12-28',
    6637.00, 217.50, 304.50, 435.00, 522.00, 8116.00, 2, 3, 3),
    ('Thaís Lisboa', 'F', '1983-06-09', 'Av. Mal. Floriano Peixoto, 2248-2258 - Centro, Nova Iguaçu - RJ, 26210-000', '2016-08-20', NULL,
    8752.00, 313.10, 375.72, 626.20, 751.44, 10818.46, 4, 3, 1),
    ('Victor Fonseca', 'M', '1990-03-23', 'Av. Dom Luís, 500 - Aldeota, Fortaleza - CE, 60160-230', '2016-02-08', NULL,
    872.00, 52.32, 113.36, 87.20, 104.64, 1229.52, 2, 3, 2),
    ('Yasmini de Almeida Richa', 'F', '1979-02-25', 'Av. Barão Homem de Melo, 1389 - Nova Granada, Belo Horizonte - MG, 30431-425', '2013-08-07', NULL,
    12466.00, 1048.50, 629.10, 1048.50, 1258.20, 16450.30, 3, 3, 3);

select * from funcionario;

-- Inserir dados na tabela Tempo_Empresa
INSERT INTO tempo_empresa (funcionario_id, tempo_empresa, faixa_tempo, ferias_acumuladas, horas_extras) VALUES
    (1, 6, '4-6 anos', 26, 103),
    (2, 6, '4-6 anos', 46, 196),
    (3, 8, 'Acima de 6 anos', 28, 94),
    (4, 6, '4-6 anos', 39, 124),
    (5, 5, '4-6 anos', 42, 82),
    (6, 10, 'Acima de 6 anos', 60, 145),
    (7, 9, 'Acima de 6 anos', 13, 114),
    (8, 10, 'Acima de 6 anos', 37, 174),
    (9, 9, 'Acima de 6 anos', 32, 132),
    (10, 11, 'Acima de 6 anos', 7, 122),
    (11, 7, 'Acima de 6 anos', 19, 82),
    (12, 9, 'Acima de 6 anos', 22, 81),
    (13, 10, 'Acima de 6 anos', 13, 153),
    (14, 10, 'Acima de 6 anos', 51, 74),
    (15, 11, 'Acima de 6 anos', 56, 11),
    (16, 10, 'Acima de 6 anos', 41, 58),
    (17, 11, 'Acima de 6 anos', 23, 32),
    (18, 8, 'Acima de 6 anos', 16, 160),
    (19, 10, 'Acima de 6 anos', 60, 154),
    (20, 10, 'Acima de 6 anos', 36, 183),
    (21, 10, 'Acima de 6 anos', 14, 44),
    (22, 9, 'Acima de 6 anos', 55, 57),
    (23, 8, 'Acima de 6 anos', 26, 15),
    (24, 9, 'Acima de 6 anos', 49, 120),
    (25, 8, 'Acima de 6 anos', 56, 198),
    (26, 7, 'Acima de 6 anos', 45, 171),
    (27, 5, '4-6 anos', 21, 63),
    (28, 7, 'Acima de 6 anos', 23, 189),
    (29, 7, 'Acima de 6 anos', 21, 80),
    (30, 8, 'Acima de 6 anos', 53, 188),
    (31, 9, 'Acima de 6 anos', 20, 175);

-- Inserir dados na tabela Avaliacao_Funcionario
INSERT INTO avaliacao_funcionario (funcionario_id, trabalho_equipe, lideranca, comunicacao, iniciativa, organizacao) VALUES
    (1, 8, 10, 10, 8, 2),
    (2, 9, 8, 10, 7, 10),
    (3, 9.8, 10, 10, 9, 10),
    (4, 7.6, 7, 8, 4, 10),
    (5, 8.2, 7, 8, 6, 10),
    (6, 9.6, 10, 10, 9, 9),
    (7, 7.4, 6, 8, 3, 10),
    (8, 6.8, 7, 4, 3, 10),
    (9, 6.4, 0, 10, 2, 10),
    (10, 9.6, 10, 10, 8, 10),
    (11, 8.4, 8, 10, 8, 10),
    (12, 5.8, 8, 8, 3, 1),
    (13, 8.4, 6, 8, 9, 9),
    (14, 8.2, 7, 7, 8, 10),
    (15, 8.8, 7, 8, 9, 10),
    (16, 7.4, 1, 7, 9, 10),
    (17, 7.8, 7, 10, 7, 9),
    (18, 7.6, 8, 1, 9, 10),
    (19, 7.2, 10, 8, 8, 2),
    (20, 7.4, 7, 10, 2, 10),
    (21, 7.8, 10, 0, 9, 10),
    (22, 8.8, 7, 10, 8, 10),
    (23, 8.6, 7, 8, 8, 10),
    (24, 9, 10, 8, 7, 10),
    (25, 8.4, 10, 10, 10, 3),
    (26, 8.8, 7, 8, 9, 10),
    (27, 8.2, 10, 8, 3, 10),
    (28, 6.6, 1, 4, 8, 10),
    (29, 8.6, 7, 10, 8, 9),
    (30, 9, 8, 9, 9, 10),
    (31, 8.8, 10, 8, 8, 6);


-- comando para informações no dashboard
SELECT COUNT(*) AS quantidade_funcionarios_ativos
FROM funcionario
WHERE data_demissao IS NULL;

-- comando para informações de contratações
select count(*) as contratacoes
from funcionario;

-- comando para informações de desligamentos
select count(*) as desligamentos
from funcionario
where data_demissao is not null;

-- comando para informações de turnover
SELECT
	ROUND(
		(CAST((SELECT COUNT(*) FROM funcionario WHERE data_demissao IS NOT NULL) AS DECIMAL) /
     	CAST((SELECT COUNT(*) FROM funcionario) AS DECIMAL)) * 100,
		2
	) AS turnover;
	
-- Contratações por ano
SELECT
    EXTRACT(YEAR FROM data_contratacao) AS ano,
    COUNT(*) AS contratacoes
FROM
    funcionario
GROUP BY
    ano
ORDER BY
    ano;

-- Desligamentos por ano
SELECT
    EXTRACT(YEAR FROM data_demissao) AS ano,
    COUNT(*) AS desligamentos
FROM
    funcionario
WHERE
    data_demissao IS NOT NULL
GROUP BY
    ano
ORDER BY
    ano;

-- Contratações por ano
SELECT
    EXTRACT(YEAR FROM data_contratacao) AS ano,
    COUNT(*) AS contratacoes
FROM
    funcionario
GROUP BY
    ano
ORDER BY
    ano;


-- Contratações e Desligamentos por ano --
-- SELECT
--     ano,
--     contratacoes,
--     desligamentos
-- FROM
--     (
--         -- Contratações por ano
--         SELECT
--             EXTRACT(YEAR FROM data_contratacao) AS ano,
--             COUNT(*) AS contratacoes
--         FROM
--             funcionario
--         GROUP BY
--             ano
--     ) contratacoes,
--     (
--         -- Desligamentos por ano
--         SELECT
--             EXTRACT(YEAR FROM data_demissao) AS ano,
--             COUNT(*) AS desligamentos
--         FROM
--             funcionario
--         WHERE
--             data_demissao IS NOT NULL
--         GROUP BY
--             ano
--     ) desligamentos
-- WHERE
--     contratacoes.ano = desligamentos.ano
-- ORDER BY
--     ano;


-- Quantidade de funcionários por gênero
SELECT
    sexo,
    COUNT(*) AS quantidade
FROM
    funcionario
GROUP BY
    sexo;
	
-- Porcentagem de funcionários por gênero
SELECT
    sexo,
    ROUND (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM funcionario)) AS porcentagem
FROM
    funcionario
GROUP BY
    sexo;


-- Quantidade de funcionários por faixa de tempo de empresa
SELECT
    faixa_tempo,
    COUNT(*) AS quantidade
FROM
    tempo_empresa
GROUP BY
    faixa_tempo;

-- Informações do funcionário, cargo, área e avaliação
SELECT
    f.nome_completo AS nome_funcionario,
    c.nome_cargo AS cargo,
    a.nome_area AS area,
    av.trabalho_equipe,
    av.lideranca,
    av.comunicacao,
    av.iniciativa,
    av.organizacao,
    f.data_nascimento,
    f.data_contratacao,
    AGE(f.data_contratacao) AS idade_contratacao,
    f.salario_total,
    av.trabalho_equipe + av.lideranca + av.comunicacao + av.iniciativa + av.organizacao AS nota_individual
FROM
    funcionario f
JOIN
    cargo c ON f.Cargo_ID = c.id
JOIN
    area a ON f.Area_ID = a.id
LEFT JOIN
    avaliacao_funcionario av ON f.id = av.funcionario_id;
