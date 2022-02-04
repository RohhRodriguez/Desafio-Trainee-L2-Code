SELECT C.ID, C.NAME AS categories, SUM(OP.UNITS_SOLD)
from CATEGORIES C
JOIN PRODUCTS AS P ON P.ID_CATEGORIES = C.ID
JOIN ORDERS_PRODUCTS AS OP ON OP.PRODUCT_ID = P.ID
GROUP BY C.ID
ORDER BY SUM DESC
LIMIT 4;

-- Fiz o SELECT solicitado no segundo exercício como consta a seguir. Tentei de todas as formas possíveis
-- chegar ao resultado exato esperado na saída do exemplo, mas sempre a coluna ID apresentava inconsistências.
-- Após várias tentativas, resolvi verificar os ids passados no script de inicialização do banco que foi
-- disponibilizado originalmente. Lá eu constatei que o ID do registro da categoria "GAMER" estava realmente
-- inconsistente com o resultado esperado no arquivo original.
-- No exercício notei que foi ordenado por SUM e apresenta como exemplo as sídas na coluna ID (1, 8, 7, 6),
-- entretanto o registro gamer foi inicializado com o ID 10, assim sendo o resultado sempre será (1, 10, 7, 6).
-- De forma resumida, utilizando os dados originalmente passados no desafio seria impossível ter o retorno como
-- no exemplo de saída do eercício e para chegar ao resultado esperado, eu precisaria alterar o ID já inserido
-- originalmente no arquivo, mas creio que foge da proposta do teste.
-- O INSERT incorreto se encontra no script "SQLTreinee22.sql" na linha 46 para conferência do exposto acima.
