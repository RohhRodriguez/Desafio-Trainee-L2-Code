-- Primeira forma que utilizei:
SELECT C.NAME, sum(P.AMOUNT)
FROM CATEGORIES C 
INNER JOIN PRODUCTS AS P on P.ID_CATEGORIES = C.ID
GROUP BY C.NAME
ORDER BY C.NAME;

-- Me preocupei com os dados obtidos neste resultado não serem iguais aos do exemplo de saída do desafio, 
-- pois a orDem dos registros da TABLE na coluna ID não batem.
-- fiz uma versão com subconsulta ordenando por ID da categoria para ver se batia...
-- Não consegui encontrar a ordenação pedida no exercício. Entretanto achei produtivo deixar ambas.
SELECT C.NAME, (
	SELECT SUM(P.AMOUNT) FROM PRODUCTS P WHERE C.ID = P.ID_CATEGORIES
) AS PRODUCT_SUM
FROM CATEGORIES C
-- WHERE (SELECT SUM(P.AMOUNT) FROM PRODUCTS P WHERE C.ID = P.ID_CATEGORIES) IS NOT NULL
ORDER BY ID;

--A linha WHERE acima é para retirar resultados NULL do resultado