-- Importação das operadoras ativas
LOAD DATA INFILE '/caminho/para/operadoras_ativas.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(registro_ans, cnpj, razao_social, nome_fantasia, modalidade, 
 logradouro, numero, complemento, bairro, cidade, uf, cep, 
 ddd, telefone, fax, email, representante, cargo_representante, 
 @data_registro_ans)
SET data_registro_ans = STR_TO_DATE(@data_registro_ans, '%d/%m/%Y');