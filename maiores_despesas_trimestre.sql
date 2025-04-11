SELECT 
    o.razao_social,
    o.nome_fantasia,
    SUM(d.valor) AS total_despesas
FROM 
    demonstracoes_contabeis d
JOIN 
    operadoras_ativas o ON d.registro_ans = o.registro_ans
WHERE 
    d.descricao LIKE 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
    AND d.ano = (SELECT MAX(ano) FROM demonstracoes_contabeis)
    AND d.trimestre = (SELECT MAX(trimestre) FROM demonstracoes_contabeis WHERE ano = (SELECT MAX(ano) FROM demonstracoes_contabeis))
GROUP BY 
    o.razao_social, o.nome_fantasia
ORDER BY 
    total_despesas DESC
LIMIT 10;