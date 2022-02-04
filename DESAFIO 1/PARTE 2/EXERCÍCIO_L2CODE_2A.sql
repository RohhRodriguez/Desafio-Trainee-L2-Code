-- Fiz o SELECT solicitado no segundo exercício como consta a seguir. Tentei de todas as formas possíveis
-- chegar ao resultado esperado. Após as tentativas, resolvi verificar os ids passados no script
-- de inicialização do banco que foi disponibilizado.
-- Lá eu constatei que o ID do registro da categoria "GAMER" está inconsistente com o resultado esperado.
-- No exercício é pedido que seja ordenado por SUM com os IDs (1, 8, 7, 6), entretanto o registro gamer foi inicializado
-- com o ID 10, assim sendo o resultado sempre será (1, 10, 7, 6).
-- Para chegar ao resultado esperado, eu precisaria alterar o ID já inserido, mas creio que foge da proposta.
-- O INSERT incorreto se encontra no script "SQLTreinee22.sql" na linha 46.

SELECT C.ID, C.NAME AS categories, SUM(OP.UNITS_SOLD)
from CATEGORIES C
JOIN PRODUCTS AS P ON P.ID_CATEGORIES = C.ID
JOIN ORDERS_PRODUCTS AS OP ON OP.PRODUCT_ID = P.ID
GROUP BY C.ID
ORDER BY SUM DESC
LIMIT 4;