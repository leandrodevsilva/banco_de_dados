-- Tabela para demonstrações contábeis
CREATE TABLE demonstracoes_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    registro_ans VARCHAR(20),
    ano INT,
    trimestre INT,
    conta_contabil VARCHAR(100),
    descricao VARCHAR(255),
    valor DECIMAL(15,2),
    FOREIGN KEY (registro_ans) REFERENCES operadoras_ativas(registro_ans)
);