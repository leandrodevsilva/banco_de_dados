-- Importação das demonstrações contábeis (2023 e 2024)
LOAD DATA INFILE '/caminho/para/demonstracoes_contabeis_2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(registro_ans, @ano, @trimestre, conta_contabil, descricao, @valor)
SET 
    ano = CAST(@ano AS UNSIGNED),
    trimestre = CAST(@trimestre AS UNSIGNED),
    valor = REPLACE(REPLACE(@valor, '.', ''), ',', '.');

LOAD DATA INFILE '/caminho/para/demonstracoes_contabeis_2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(registro_ans, @ano, @trimestre, conta_contabil, descricao, @valor)
SET 
    ano = CAST(@ano AS UNSIGNED),
    trimestre = CAST(@trimestre AS UNSIGNED),
    valor = REPLACE(REPLACE(@valor, '.', ''), ',', '.');