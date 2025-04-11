# Análise de Despesas de Operadoras de Saúde

Este repositório contém um conjunto de scripts SQL para análise das maiores despesas de operadoras de saúde ativas, com foco em eventos/sinistros médico-hospitalares. Os projetos incluem a criação de tabelas, importação de dados e consultas para análises trimestral e anual.

## Estrutura do Banco de Dados

### Tabelas Principais

1. **`operadoras_ativas`**  
   Armazena informações das operadoras de saúde ativas, incluindo:
   - Dados cadastrais (CNPJ, razão social, nome fantasia)
   - Informações de contato (endereço, telefone, e-mail)
   - Detalhes do representante legal

2. **`demonstracoes_contabeis`**  
   Contém os dados contábeis das operadoras, com:
   - Registro ANS (chave estrangeira)
   - Ano e trimestre de referência
   - Descrição da conta contábil
   - Valor monetário

## Scripts de Importação

- **`importacao_operadoras_ativas.sql`**  
  Importa dados de um arquivo CSV para a tabela `operadoras_ativas`, convertendo formatos de data.

- **`importacao_demonstracoes_contabeis.sql`**  
  Importa dados de demonstrações contábeis de arquivos CSV (2023 e 2024), tratando:
  - Conversão de tipos numéricos
  - Formatação de valores monetários (substituição de vírgulas por pontos)

## Consultas Analíticas

### 1. Maiores Despesas por Trimestre (`maiores_despesas_trimestre.sql`)
```sql
-- Retorna as 10 operadoras com maiores despesas no último trimestre disponível
-- Filtra por eventos/sinistros médico-hospitalares
-- Retorna as 10 operadoras com maiores despesas no último ano disponível
-- Mesmo critério de filtro da consulta trimestral
```

### Como Executar

Crie as tabelas executando:

`tabela_operadoras_ativas.sql`

`tabela_demonstracoes_contabeis.sql`

Importe os dados:

`importacao_operadoras_ativas.sql`

`importacao_demonstracoes_contabeis.sql`

Execute as consultas analíticas conforme necessidade.

### Observações: 

Os caminhos dos arquivos CSV nos scripts de importação devem ser ajustados conforme o ambiente.

As consultas filtram automaticamente pelo ano/trimestre mais recente disponível.

A análise foca especificamente em despesas com eventos/sinistros de saúde médico-hospitalar.

## Detalhes Adicionais

### Relacionamento entre Tabelas
- A tabela `demonstracoes_contabeis` referencia `operadoras_ativas` através do campo `registro_ans`, garantindo a integridade dos dados.
- A chave primária de `operadoras_ativas` é `registro_ans`, enquanto `demonstracoes_contabeis` usa um `id` autoincrementável.

### Tratamento de Dados
- **Formatação de Valores Monetários**:  
  Os scripts convertem valores no formato brasileiro (ex: `1.234,56`) para o padrão SQL (ex: `1234.56`), removendo pontos e substituindo vírgulas por pontos.

- **Datas**:  
  A coluna `data_registro_ans` é convertida de texto (formato `DD/MM/AAAA`) para o tipo `DATE` do SQL.

### Otimizações
- **Índices**:  
  Para melhorar o desempenho das consultas, recomenda-se adicionar índices aos campos frequentemente filtrados:
  ```sql
  CREATE INDEX idx_ano_trimestre ON demonstracoes_contabeis(ano, trimestre);
  CREATE INDEX idx_descricao ON demonstracoes_contabeis(descricao);

### Filtros Dinâmicos:

As consultas usam subconsultas para identificar automaticamente o ano e trimestre mais recentes:

```WHERE ano = (SELECT MAX(ano) FROM demonstracoes_contabeis)```

### Próximos Passos

- Adicionar mais consultas analíticas:

- Comparativo trimestral/anual.

- Análise por região (UF) ou modalidade.

- Automatizar a importação:

- Scripts para atualização periódica dos dados.

## Dashboard de visualização:

Integrar com ferramentas como Power BI ou Metabase.

## Contribuição

Sugestões e melhorias são bem-vindas! Abra uma issue ou envie um pull request.
