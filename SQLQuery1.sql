SELECT FirstName, LastName, EmailAddress
FROM DimCustomer;

SELECT TOP(10) ProductName -- SELECIONA TOP 10 DOS CAMPOS DE TODA A TABELA
FROM dimProduct;

SELECT TOP(10) PERCENT ProductName -- SELECIONA 10% DOS CAMPOS DE TODA A TABELA
FROM dimProduct;

SELECT ColorName
FROM dimProduct;

SELECT DISTINCT ColorName
FROM dimProduct;

SELECT
ProductName AS Produto, -- RENOMEIA AS COLUNAS DAS TABELAS
BrandName AS Marca,
ColorName AS Cor
FROM DimProduct;

SELECT
ProductName AS 'Nome Produto', -- RENOMEIA AS COLUNAS DAS TABELAS
BrandName AS 'Nome Marca', -- USO DE ASPAS SIMPLES PERMITE DAR ESPA�O
ColorName AS 'Nome Cor'
FROM DimProduct;

GO
-- 1
SELECT * 
FROM DimProduct; -- N�O H� DEFASAGEM

SELECT *
FROM DimCustomer; -- TOTAL DE CLIENTES 19145 

GO
--2
SELECT 
CustomerKey AS 'ID Cliente', 
FirstName AS 'Nome', 
EmailAddress AS 'Email', 
BirthDate AS 'Data Nascimento'
FROM DimCustomer;

GO
--3
SELECT TOP(100) *  -- SELECIONA TOP 100 DOS CAMPOS DE TODA A TABELA
FROM DimCustomer;

SELECT TOP(20) PERCENT *  -- SELECIONA TOP 10 PORCENTO DOS CAMPOS DE TODA A TABELA
FROM DimCustomer;

SELECT TOP(100) FirstName, EmailAddress, BirthDate 
FROM DimCustomer;  -- SELECIONA TOP 100 

SELECT TOP(100) 
FirstName AS 'Nome', 
EmailAddress AS 'Email', 
BirthDate AS 'Data Nascimento' -- SELECIONA TOP 100
FROM DimCustomer;
GO
--4
SELECT DISTINCT 
Manufacturer AS 'Fornecedor'
FROM DimProduct;
GO
--5
SELECT DISTINCT ProductKey
FROM DimProduct;

SELECT DISTINCT ProductKey
FROM FactSales;
GO
-- Exemplo 1 SELECIONA AS 100 PRIMEIRAS LINHAS
SELECT TOP(100) StoreName, EmployeeCount 
FROM DimStore 
ORDER BY EmployeeCount;

SELECT TOP(100) StoreName, EmployeeCount 
FROM DimStore 
ORDER BY EmployeeCount DESC;
GO
-- Exemplo 2 ORDENA DE ACORDO COM A COLUNA STORENAME
SELECT TOP(100) StoreKey, StoreName
FROM DimStore
ORDER BY StoreName;

SELECT TOP(100) StoreKey, StoreName
FROM DimStore
ORDER BY StoreName DESC;
GO
-- EXEMPLO 3 ORDENA DE ACORDO COM A COLUNA UNITCOST(DESC) E WEIGHT((ASC)ENDENTE)
SELECT TOP(100)
ProductName,
Weight,
UnitCost
FROM DimProduct
ORDER BY UnitCost DESC, Weight ASC;
GO
-- EXEMPLO 4

SELECT * FROM DimProduct       --SELECIONA TODAS AS LINHAS O NOME DO PRODUTO QUE CONTENHA A PALAVRA "MP3"
WHERE ProductName LIKE '%MP3%';
GO
-- EXEMPLO 5 OPERADORES L�GICOS

SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver';

SELECT * FROM DimProduct
WHERE ColorName= 'Blue' OR ColorName = 'Silver';

SELECT * FROM DimProduct
WHERE NOT ColorName= 'Blue';
GO
-- EXEMPLO 6 CLAUSULA IN
SELECT * FROM DimProduct
WHERE ColorName IN ('Blue', 'Silver', 'Black');

SELECT * FROM DimProduct
WHERE ColorName NOT IN ('Blue', 'Silver', 'Black');

-- EXEMPLO 7 BETWEEN
SELECT TOP(1000) * FROM FactSales
WHERE SalesQuantity BETWEEN 10 AND 15;
GO
-- EXEMPLO 8 IS NULL
SELECT * FROM DimCustomer
WHERE FirstName IS NULL;

SELECT * FROM DimCustomer
WHERE FirstName IS NOT NULL;

GO
-- EX 1
SELECT TOP(100) * 
FROM FactSales
ORDER BY SalesAmount DESC;

GO
-- EX 2
SELECT TOP(10) *
FROM DimProduct
ORDER BY UnitPrice DESC, Weight ASC, AvailableForSaleDate ASC;

GO
-- EX 3
SELECT 
ProductName AS 'Nome do Produto',
Weight AS 'Peso (Libras)'
FROM DimProduct
WHERE Weight > 100
ORDER BY Weight DESC;

GO
-- EX 4
SELECT 
StoreName AS 'Nome da Loja',
OpenDate AS 'Data de Abertura',
EmployeeCount AS 'Qtd. Funcionarios'
FROM DimStore
WHERE StoreType = 'Store' AND Status = 'On';

GO
-- EX 5
SELECT * 
FROM DimProduct
WHERE BrandName = 'Litware' AND AvailableForSaleDate = '15/03/2009';

V
-- EX 6
SELECT * FROM DimStore
WHERE Status = 'OFF';

SELECT * FROM DimStore
WHERE CloseDate IS NOT NULL;
GO
-- EX 7
SELECT * FROM DimStore
WHERE EmployeeCount BETWEEN 1 AND 20;

SELECT * FROM DimStore
WHERE EmployeeCount BETWEEN 21 AND 50;

SELECT * FROM DimStore
WHERE EmployeeCount > 50;
GO

-- EX 8
SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%LCD%';
GO
-- EX 9
SELECT * FROM DimProduct
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName 
IN ('Contoso', 'Litware', 'Fabrikam');
GO
-- EX 10
SELECT * FROM DimProduct
WHERE BrandName =  'Contoso' AND ColorName =  'Silver' AND Weight BETWEEN 10 AND 30
ORDER BY UnitPrice DESC;
GO

-- FUNC�ES
SELECT COUNT(CustomerKey) AS 'Qtd. Clientes' -- CONTA QUANTOS ITENS TEM NA TABELA
FROM DimCustomer;

SELECT COUNT(CustomerKey) AS 'Qtd. Clientes' -- CONTA QUANTOS ITENS TEM NA TABELA E V� QUANTAS MULHERES TEM
FROM DimCustomer
WHERE Gender = 'F';

SELECT COUNT(DISTINCT DepartmentName) AS 'Qtd. �reas' -- CONTA QUANTOS ITENS TEM NA TABELA E DESCONSIDERA ITENS REPETIDOS
FROM DimEmployee;

SELECT SUM(SalesQuantity) AS 'Total Vendido' -- CONTA O TOTAL DE VENDAS NA TABELA
FROM FactSales;

SELECT SUM(SalesQuantity) AS 'Total Vendido' -- CONTA O TOTAL DE VENDAS NA TABELA ONDE O PRE�O UNITARIO � IGUAL OU MAIOR QUE 100
FROM FactSales
WHERE UnitPrice >= 100;

SELECT AVG (SalesQuantity) AS 'M�dia de Vendas' -- CONTA A QUANTIDADE M�DIA NA TABELA
FROM FactSales;

SELECT AVG (SalesQuantity) AS 'M�dia de Vendas' -- CONTA A QUANTIDADE M�DIA NA TABELA � IGUAL OU MAIOR QUE 100
FROM FactSales
WHERE UnitPrice > 100;

SELECT MIN (SalesQuantity) AS 'M�nimo de Vendas' -- RETORNA O VALOR MINIMO DA TABELA
FROM FactSales;

SELECT MAX (SalesQuantity) AS 'M�ximo de Vendas' -- RETORNA O VALOR MAXIMO DA TABELA
FROM FactSales;
GO

-- EX 1

SELECT TOP (100) * FROM FactSales
SELECT 
SUM(SalesQuantity) AS 'Qtd. Vendas',
SUM(SalesQuantity) AS 'Qtd. Devolu��es'
FROM FactSales
WHERE ChannelKey = 1;

SELECT *
FROM FactSales;

GO
-- EX 2
SELECT AVG(YearlyIncome) AS 'M�dia Salarial'
FROM DimCustomer
WHERE Occupation = 'Professional';

SELECT *
FROM DimCustomer;

GO
-- EX 3
SELECT *
FROM DimStore;

SELECT TOP 1 StoreName AS 'Nome da Loja', MAX(EmployeeCount) AS 'Qtd. Funcionarios' FROM DimStore
GROUP BY StoreName, EmployeeCount 
ORDER BY [Qtd. Funcionarios] DESC;

SELECT TOP 1 StoreName AS 'Nome da Loja', MIN(EmployeeCount) AS 'Qtd. Funcionarios' FROM DimStore
WHERE EmployeeCount IS NOT NULL
GROUP BY StoreName, EmployeeCount;
GO

-- EX 4
SELECT *
FROM DimEmployee;

SELECT COUNT(Gender) AS 'G�nero Masculino'
FROM DimEmployee
WHERE Gender = 'M';

SELECT COUNT(Gender) AS 'G�nero Feminino'
FROM DimEmployee
WHERE Gender = 'F';

SELECT TOP 1 firstName, LastName, EmailAddress, HireDate
FROM DimEmployee
WHERE Gender = 'M'
ORDER BY HireDate ASC;

SELECT TOP 1 firstName,LastName, EmailAddress, HireDate
FROM DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate ASC;
GO

--EX 5 
SELECT * FROM DimProduct
SELECT 
COUNT(DISTINCT ColorName) AS 'Qtd. Cores',
COUNT(DISTINCT BrandName) AS 'Qtd. Marcas',
COUNT(DISTINCT ClassName) AS 'Qtd. Classes de Produto'
FROM DimProduct;
GO

-- GROUP 
SELECT DepartmentName, COUNT (DepartmentName) AS 'Total de Funcion�rios'
FROM DimEmployee
GROUP BY DepartmentName;

GO

SELECT StoreType, SUM (EmployeeCount) AS 'Qtd. Total de Funcion�rios'
FROM DimStore
GROUP BY StoreType
ORDER BY SUM (EmployeeCount) DESC;

GO

SELECT 
ColorName AS 'Cor Produto',
COUNT(ColorName) AS 'Qtd. Total'
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName

GO

SELECT BrandName AS 'Marca',
COUNT(BrandName) AS 'Total Marca'
FROM DimProduct
GROUP BY BrandName
HAVING COUNT(BrandName) >= 200;

GO

SELECT BrandName AS 'Marca',
COUNT(BrandName) AS 'Total Marca'
FROM DimProduct
WHERE ClassName = 'Economy'
GROUP BY BrandName
HAVING COUNT(BrandName) >= 200;

GO

-- EX 1
-- 1A Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas 
-- (channelkey)
SELECT TOP 100 channelKey AS 'ID Canal',
SUM(SalesQuantity) AS 'Qtd. Vendas'
FROM FactSales
GROUP BY channelKey;

SELECT *
FROM FactSales;
 GO
 -- 1B  Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade 
-- total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

SELECT StoreKey AS 'ID Loja',
SUM(SalesQuantity) AS 'Qtd. Vendas',
SUM(ReturnQuantity) AS 'Qtd. Devolvida'
FROM FactSales
GROUP BY StoreKey;

GO
-- 1C Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas 
-- para o ano de 2007
SELECT channelKey AS 'ID Loja',
SUM(SalesAmount) AS 'Faturamneto Total'
FROM FactSales
WHERE DateKey LIKE '%2007%'
GROUP BY channelKey;

GO
-- 2 Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor 
-- total vendido (SalesAmount) por produto (ProductKey). 

-- 2A A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso, 
-- mostrar apenas os produtos que tiveram um resultado final de vendas maior do que 
-- $5.000.000.
SELECT TOP (100) * FROM FactSales
SELECT ProductKey AS 'ID Produto',
SUM(SalesAmount) AS 'Total Vendas',
SUM(SalesQuantity) AS 'Qtd. Vendas'
FROM FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000.00
ORDER BY SUM(SalesAmount) DESC;

GO
-- 2B Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas. 
-- Desconsidere o filtro de $5.000.000 aplicado.
SELECT TOP 10 ProductKey AS 'ID Produto',
SUM(SalesAmount) AS 'Total Vendas',
SUM(SalesQuantity) AS 'Qtd. Vendas'
FROM FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) > 5000000.00
ORDER BY SUM(SalesAmount) DESC;

GO
-- 3
-- 3A Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas. 
-- Desconsidere o filtro de $5.000.000 aplicado.
SELECT *
FROM FactOnlineSales;

SELECT TOP (1) * FROM FactOnlineSales

SELECT TOP (1) CustomerKey AS 'ID Cliente',
SUM(SalesQuantity) AS 'Total Comprado'
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC;

GO
-- 3B Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto
-- e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
SELECT TOP (3) ProductKey AS 'ID Produto',
SUM(SalesQuantity) AS 'Total Comprado'
FROM FactOnlineSales 
WHERE CustomerKey = '19037'
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC;

GO
-- 4A Fa�a um agrupamento e descubra a quantidade total de produtos por marca
SELECT * FROM DimProduct;

SELECT BrandName AS 'Marca',
COUNT(ProductName) AS 'Qtd. Produtos'
FROM DimProduct
GROUP BY BrandName;

GO
-- 4B Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
SELECT ClassName AS 'Tipo do Produto',
AVG (UnitPrice) AS 'M�dia dos Pre�os'
FROM DimProduct
GROUP BY ClassName;

GO
-- 4C  Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.
SELECT ColorName AS 'Cor',
SUM(Weight) AS 'Peso'
FROM DimProduct
GROUP BY ColorName;

GO
-- 5 Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName). 
-- A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em 
-- ordem decrescente.
SELECT DISTINCT StockTypeName AS 'Produto',
SUM (Weight) AS 'Peso'
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY SUM (Weight) DESC;

GO
-- 6 Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as 
-- 16 op��es de cores?
SELECT BrandName AS 'Marca',
COUNT (DISTINCT ColorName) AS 'Cores'
FROM DimProduct
GROUP BY BrandName;

GO
-- 7 Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia 
-- salarial de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus 
-- conhecimentos em SQL
SELECT * FROM DimCustomer;

SELECT Gender AS 'G�nero',
COUNT (CustomerKey) AS 'Total de Clientes',
AVG (YearlyIncome) AS 'M�dia Salarial'
FROM DimCustomer
WHERE GENDER IS NOT NULL
GROUP BY GENDER;

GO
-- 8 Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de 
-- acordo com o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer 
-- esse agrupamento.
SELECT Education AS 'N�vel Escolar',
COUNT (CustomerKey) AS 'Total de Clientes',
AVG (YearlyIncome) AS 'M�dia Salarial'
FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education;

GO
-- 9 Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o 
-- Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os 
-- funcion�rios ativos.
SELECT * FROM DimEmployee;

SELECT DepartmentName AS 'Departamento',
COUNT (EmployeeKey) AS 'Total de Funcion�rios'
FROM DimEmployee
WHERE Status = 'Current' OR EndDate IS NULL
GROUP BY DepartmentName;

GO
-- 10 Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc� 
-- deve considerar apenas as mulheres, dos departamentos de Production, Marketing, 
-- Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000

SELECT Title AS 'Cargo',
SUM (VacationHours) AS 'Horas de F�rias'
FROM DimEmployee
WHERE GENDER = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') 
AND HireDate BETWEEN '1999-01-01' AND '2000-12-31'
GROUP BY Title;

GO



-- OUTRO BANCO DE DADOS CHAMADO LOJADB

CREATE DATABASE LojaDB;
USE LojaDB;

GO

CREATE TABLE CLIENTES (
ClienteID INT PRIMARY KEY,
NomeCliente VARCHAR(100),
Cidade VARCHAR(50)
);

GO

CREATE TABLE PRODUTOS (
ProdutoID INT PRIMARY KEY,
NomeProduto VARCHAR(100),
CategoriaID INT,
Preco DECIMAL (10, 2)
);

GO

CREATE TABLE PEDIDOS (
PedidoID INT PRIMARY KEY,
ClienteID INT,
ProdutoID INT,
DataPedido DATE,
FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID),
FOREIGN KEY (ProdutoID) REFERENCES Produtos (ProdutoID)
);
GO

CREATE TABLE CATEGORIAS (
CategoriaID INT PRIMARY KEY,
NomeCategoria VARCHAR(100))

GO

INSERT INTO CLIENTES (ClienteID, NomeCliente, Cidade) 
VALUES
(1, 'Maria Silva', 'S�o Paulo'),
(2, 'Jo�o Santos', 'Rio de Janeiro'),
(3, 'Ana Costa', 'Belo Horizonte');

GO

INSERT INTO PEDIDOS (PedidoID, ClienteID, ProdutoID, DataPedido) 
VALUES
(1, 1, 1, '2024-01-15'),
(2, 2, 3, '2024-01-20'),
(3, 2, 1, '2024-02-10');

GO

INSERT INTO CATEGORIAS (CategoriaID, NomeCategoria)
VALUES
(1, 'Eletr�nicos'),
(2, 'Vestu�rio');

GO

INSERT INTO PRODUTOS (ProdutoID, NomeProduto, CategoriaID, Preco) 
VALUES
(1, 'Celular', 1 , 1500.00),
(2, 'Televis�o', 1 , 3000.00),
(3, 'Camiseta', 2 , 50.00);

GO

SELECT * FROM CLIENTES;

SELECT * FROM PRODUTOS;

SELECT * FROM CATEGORIAS;

SELECT * FROM PEDIDOS;

SELECT Clientes.NomeCliente, Pedidos.DataPedido FROM CLIENTES
INNER JOIN PEDIDOS ON Clientes.ClienteID = Pedidos.ClienteID;

SELECT Clientes.NomeCliente, Pedidos.DataPedido FROM CLIENTES
LEFT JOIN PEDIDOS ON Clientes.ClienteID = Pedidos.ClienteID; 
GO


SELECT Clientes.NomeCliente, Pedidos.DataPedido, Produtos.NomeProduto, Categorias.NomeCategoria FROM Clientes
INNER JOIN
Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
INNER JOIN
Produtos ON Produtos.ProdutoID = Pedidos.ProdutoID
INNER JOIN
Categorias ON Produtos.CategoriaID = Categorias.CategoriaID;

GO

Select * from Clientes;
Select * from Pedidos;
Select * from Produtos;
Select * from Categorias;

GO

SELECT Clientes.NomeCliente FROM Clientes -- UNION FAZ UNI�O ENTRE AS TABELAS OU SEJA N�O DEIXA REPETIR OS CAMPOS
UNION
SELECT Clientes.NomeCliente FROM Pedidos
INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

GO

SELECT Clientes.NomeCliente FROM Clientes -- UNION FAZ UNI�O ENTRE AS TABELAS OU SEJA N�O DEIXA REPETIR OS CAMPOS
UNION ALL
SELECT Clientes.NomeCliente FROM Pedidos
INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

GO

-- EX 1
-- 1A Exibir o nome de todos os clientes que fizeram pedidos, mostrando tamb�m o ID do pedido.
Select * from Clientes;
Select * from Pedidos;
Select * from Produtos;
Select * from Categorias;

GO

SELECT Clientes.NomeCliente, Pedidos.PedidoID, Pedidos.ClienteID FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

GO

-- 1B E se voc� quisesse tamb�m ver a data do pedido? Adicione a coluna DataPedido no resultado.

SELECT
Clientes.NomeCliente, Pedidos.PedidoID, Pedidos.DataPedido
FROM  Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;
GO

-- 2A Listar todos os clientes, mesmo aqueles que ainda n�o fizeram pedidos, e exibir o n�mero do pedido (se houver).
SELECT Clientes.NomeCliente, Pedidos.PedidoID, Pedidos.ClienteID FROM Clientes
LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;
GO

-- 2B Desafio adicional: Mostre a cidade dos clientes al�m do nome e PedidoID.
SELECT Clientes.NomeCliente, Clientes.Cidade, Pedidos.PedidoID, Pedidos.ClienteID FROM Clientes
LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

GO

-- 3A Combinar os resultados de todos os clientes que est�o na tabela de Clientes e aqueles que aparecem na tabela de Pedidos (clientes que fizeram pelo menos um pedido). Evite duplicatas.
SELECT Clientes.NomeCliente, Pedidos.ClienteID 
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
UNION
SELECT Clientes.NomeCliente, Clientes.ClienteID 
FROM Clientes;

GO

-- 3B E se voc� quiser adicionar a cidade dos clientes no resultado? Atualize a consulta para incluir essa informa��o
SELECT Clientes.NomeCliente, Clientes.Cidade AS Cidade, Pedidos.ClienteID 
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
UNION
SELECT Clientes.NomeCliente, Clientes.Cidade, Clientes.ClienteID 
FROM Clientes;

GO

-- 4A Combinar os resultados de todos os clientes da tabela Clientes e aqueles que fizeram pedidos, mostrando todas as ocorr�ncias, inclusive 
-- duplicadas.
SELECT Clientes.NomeCliente, Pedidos.ClienteID 
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
UNION ALL
SELECT Clientes.NomeCliente, Clientes.ClienteID 
FROM Clientes;

GO

-- 4B Tente contar quantas vezes cada cliente aparece no resultado final (dica: use COUNT e lembre-se do conceito de 
-- subconsulta).
SELECT NomeCliente, COUNT(*) AS 'N�mero de Ocorr�ncias'FROM (SELECT Clientes.NomeCliente
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
UNION ALL
SELECT Clientes.NomeCliente FROM Clientes) AS Subconsulta
GROUP BY NomeCliente;

GO

-- 5.1
USE LojaDB;
CREATE TABLE DetalhesPedidos (
DetalheID INT PRIMARY KEY,
PedidoID INT,
ProdutoID INT,
Quantidade INT,
FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID), -- Chave estrangeira para Pedidos
FOREIGN KEY (ProdutoID) REFERENCES Produtos (ProdutoID) -- Chave estrangeira para Produtos
);

GO

-- 5.2
INSERT INTO DetalhesPedidos (DetalheID, PedidoID, ProdutoID, Quantidade)
VALUES
(1, 1, 1, 2), -- Pedido 1 cont�m 2 unidades do Produto 1
(2, 1, 2, 1), -- Pedido 1 cont�m 1 unidade do Produto 2
(3, 2, 3, 5), -- Pedido 2 cont�m 5 unidades do Produto 3
(4, 3, 2, 2); -- Pedido 3 cont�m 2 unidades do Produto 2

GO

-- 5.3 Objetivo: Exibir o nome dos clientes, os detalhes dos produtos comprados (nome do produto e quantidade), e a data em que os pedidos foram feitos.
-- Fa�a uma consulta com m�ltiplos JOINs, utilize todas as tabelas do banco de dados LojaDB e ordene por Pedidos.DataPedido
Select * from Clientes;
Select * from Pedidos;
Select * from Produtos;
Select * from Categorias;
Select * from DetalhesPedidos;

GO

SELECT Clientes.NomeCliente, Pedidos.DataPedido, Produtos.NomeProduto, Categorias.NomeCategoria, DetalhesPedidos.Quantidade FROM Clientes
INNER JOIN
Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
INNER JOIN
Produtos ON Produtos.ProdutoID = Pedidos.ProdutoID
INNER JOIN
Categorias ON Produtos.CategoriaID = Categorias.CategoriaID
INNER JOIN
DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
ORDER BY Pedidos.DataPedido DESC;

GO

-- EX 1
SELECT * FROM CLIENTES;
SELECT * FROM PEDIDOS;

GO

SELECT Clientes.NomeCliente, COUNT(Pedidos.ClienteID) AS 'N�mero de Pedidos'
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
GROUP BY NomeCliente;

GO

-- EX 2
SELECT Clientes.NomeCliente, SUM(DetalhesPedidos.Quantidade) AS 'Total de Pedidos'
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
GROUP BY NomeCliente;

GO

-- EX 3
SELECT Clientes.NomeCliente, SUM(DetalhesPedidos.Quantidade * Produtos.Preco) AS 'Total Gasto'
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
GROUP BY Clientes.NomeCliente;

GO

-- EX 4

SELECT Produtos.NomeProduto, SUM(DetalhesPedidos.Quantidade) AS 'Total Quantidades Vendidas'
FROM Produtos
INNER JOIN DetalhesPedidos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
GROUP BY Produtos.NomeProduto;

GO
-- EX 5
SELECT Pedidos.DataPedido, SUM(DetalhesPedidos.Quantidade * Produtos.Preco) AS 'Faturamento'
FROM Pedidos
INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
GROUP BY Pedidos.DataPedido
ORDER BY Pedidos.DataPedido DESC;

GO




------------------------------------------------------------------------------------- > CONTOSO < -------------------------------------------------------------------------------------------------------
USE ContosoRetailDW;
GO
-- EX 1 Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela DimProductSubcategory para a tabela DimProduct.

SELECT DimProduct.ProductKey, DimProduct.ProductName, DimProductSubcategory.ProductSubcategoryName
FROM DimProduct
INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey;

GO

-- EX 2 Identifique uma coluna em comum entre as tabelas DimProductSubcategory e DimProductCategory. Utilize essa coluna para complementar informa��es na tabela DimProductSubcategory a partir da
-- DimProductCategory. Utilize o LEFT JOIN.
SELECT DimProductSubcategory.ProductSubcategoryKey, DimProductSubcategory.ProductSubcategoryName, DimProductCategory.ProductCategoryName
FROM DimProductSubcategory
LEFT JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;

GO

-- EX 3 Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do Pa�s associados (de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas: StoreKey,
-- StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT JOIN neste exerc�cio.
SELECT DimStore.StoreKey, DimStore.StoreName, DimStore.EmployeeCount, DimGeography.ContinentName, DimGeography.RegionCountryName
FROM DimStore
LEFT JOIN DimGeography ON DimStore.GeographyKey = DimGeography.GeographyKey;

GO

-- EX 4 Complementa a tabela DimProduct com a informa��o de ProductCategoryDescription. Utilize o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.
SELECT TOP 1000p.ProductKey, p.ProductName, p.ProductSubcategoryKey, ps.ProductSubcategoryName, pc.ProductCategoryDescription
FROM DimProduct p
LEFT JOIN DimProductSubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
LEFT JOIN DimProductCategory pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
ORDER BY p.ProductKey;

GO

-- EX 5 Algumas subcategorias n�o possuem nenhum exemplar de produto. Identifique que subcategorias s�o essas.
SELECT DimProductSubcategory.ProductSubcategoryKey, DimProductSubcategory.ProductSubcategoryName
FROM DimProductSubcategory
LEFT JOIN DimProduct ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
WHERE DimProduct.ProductKey IS NULL;

GO

-- OPERA��ES B�SICAS
SELECT 10 AS 'N�mero'

SELECT 'Marcus' AS 'Nome'

SELECT '21/06/2021' AS 'Data'

GO

-- OPERA��ES COM N�MEROS 
SELECT 10 + 20

SELECT 20 - 5

SELECT 31 * 40

SELECT 431.0/23

GO

-- OPERAC�ES COM TEXTO

SELECT 'SQL' + ' ' + 'Impressionador'

SELECT SQL_VARIANT_PROPERTY ('31/05/2014', 'BaseType') AS 'Data 1'

SELECT SQL_VARIANT_PROPERTY (CAST('31/05/2014' AS datetime), 'BaseType') AS 'Data 2'

SELECT FORMAT (1000, 'N') AS 'N�mero'

SELECT FORMAT (1000, 'G') AS 'Geral'

SELECT FORMAT (1000, 'C') AS 'Moeda'


SELECT FORMAT (123456789, '###-##-####') AS 'Personalizado'


SELECT FORMAT (CAST('21/03/2021' AS DATETIME), 'yyyy/MM/dd') AS 'Data'

SELECT ROUND (18.739130, 2) AS 'Round 1' -- ARREDONDA

SELECT ROUND (18.739130, 2, 1) AS 'Round 1' -- CORTA OS NUMEROS A PARTIR DA SEGUNDA CASA

SELECT FLOOR (18.739130) AS 'Floor' -- ARREDONDA PARA BAIXO

SELECT CEILING (18.739130) AS 'Ceiling' -- ARREDONDA PARA CIMA

GO

-- VARIAVEIS
DECLARE @var TIPO
SET @var = valor

DECLARE @quantidade INT
SET @quantidade = 100

SELECT @quantidade AS Quantidade;

DECLARE @var1 TIPO1, @var2 TIPO 2
SET @var1 = valor1
SET @var2 = valor2

DECLARE @quantidade INT, @preco FLOAT, @faturamento FLOAT
SET @quantidade = 100
SET @preco = 8.99
SET @faturamento = @quantidade * @preco

SELECT @quantidade AS Quantidade, @preco AS Pre�o, @faturamento AS Faturamento;

DECLARE @idade INT
SET @idade = 30

SELECT @idade

DECLARE @preco FLOAT
SET @preco = 10.89

SELECT @preco

DECLARE @nome VARCHAR(50)
SET @nome = 'Mateus'

SELECT @nome;

DECLARE @data DATE
SET @data = '2021-10-28'

SELECT @data;


DECLARE @varDesconto FLOAT
SET @varDesconto = 0.10
SELECT ProductKey AS 'ID', ProductName AS 'Nome do Produto', UnitPrice AS 'Pre�o', UnitPrice * (1 - @varDesconto) AS 'Preco com Desconto'
FROM DimProduct;


DECLARE @varData DATE
SET @varData = '01/01/1980'
SELECT FirstName AS 'Nome', LastName AS 'Sobrenome', BirthDate AS 'Data de Nascimento', 'Cliente' AS 'Tipo'
FROM DimCustomer
WHERE BirthDate >= @varData
UNION
SELECT FirstName AS 'Nome', LastName AS 'Sobrenome', BirthDate AS 'Data de Nascimento', 'Funcion�rio' AS 'Tipo'
FROM DimEmployee
WHERE BirthDate >= @varData
ORDER BY [Data de Nascimento];


DECLARE @varData DATE 
DECLARE @varNumFuncionarios INT
DECLARE @varNumClientes INT
SET @varData = '01/01/1980'
SET @varNumFuncionarios = (SELECT COUNT(*) FROM DimEmployee WHERE BirthDate >= @varData)
SET @varNumClientes = (SELECT COUNT(*) FROM DimCustomer WHERE BirthDate >= @varData)
SELECT 'N�mero de Funcion�rios', @varNumFuncionarios
UNION
SELECT 'N�mero de Clientes', @varNumClientes;

---
SET NOCOUNT ON

DECLARE @varData DATE 
DECLARE @varNumFuncionarios INT
DECLARE @varNumClientes INT
SET @varData = '01/01/1980'
SET @varNumFuncionarios = (SELECT COUNT(*) FROM DimEmployee WHERE BirthDate >= @varData)
SET @varNumClientes = (SELECT COUNT(*) FROM DimCustomer WHERE BirthDate >= @varData)
PRINT 'N�mero de Funcion�rios = ' + CAST(@varNumFuncionarios AS VARCHAR(MAX))
PRINT 'N�mero de Clientes = ' + CAST(@varNumClientes AS VARCHAR(MAX));

--

SELECT TOP(100) * FROM FactSales
DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido FLOAT

SELECT TOP(1) @varProdutoMaisVendido = ProductKey, @varTotalMaisVendido = SalesAmount
FROM FactSales
ORDER BY SalesAmount DESC

SELECT @varProdutoMaisVendido AS 'Produto', @varTotalMaisVendido AS 'Total'
SELECT ProductName
FROM DimProduct
WHERE ProductKey = @varProdutoMaisVendido

SELECT * FROM DimProduct;



DECLARE @ListaNomes VARCHAR(MAX)
SET @ListaNomes = ' '
SELECT @ListaNomes = @ListaNomes + FirstName + ', ' + CHAR(10)
FROM DimEmployee
WHERE DepartmentName = 'Marketing'

PRINT LEFT(@ListaNomes, DATALENGTH(@ListaNomes) - 3);


SELECT @@SERVERNAME AS 'Nome do Servidor'

SELECT @@VERSION AS 'Vers�o'

SELECT * FROM DimProduct
SELECT @@ROWCOUNT AS 'Contagem de Linhas'

GO
-- EXERCICIOS VARIAVEIS

-- 1
DECLARE @valor1 AS INT
DECLARE @valor2 AS INT
DECLARE @valor3 AS INT
DECLARE @valor4 AS INT
SET @valor1 = 10
SET @valor2 = 5
SET @valor3 = 34
SET @valor4= 7

-- 1A
DECLARE @resultadoSoma AS INT

SET @resultadoSoma = @valor1 + @valor2
PRINT(@resultadoSoma);

-- 1B
DECLARE @resultadoSubtracao AS INT

SET @resultadoSubtracao = @valor3 - @valor4
PRINT(@resultadoSubtracao);

-- 1C
DECLARE @resultadoMultiplicacao AS INT

SET @resultadoMultiplicacao = @valor1 * @valor4
PRINT(@resultadoMultiplicacao);

-- 1D
DECLARE @resultadoDivisao AS FLOAT

SET @resultadoDivisao = CAST(@valor3 AS FLOAT) / CAST(@valor4 AS FLOAT)
PRINT ROUND(@resultadoDivisao, 2);

GO
-- 2
DECLARE @Produto AS VARCHAR(50) 
SET @Produto = 'Celular'
DECLARE @quantidadeProduto AS INT
SET @quantidadeProduto = 12
DECLARE @precoProduto AS FLOAT
SET @precoProduto = 9.99
DECLARE @faturamentoProduto AS FLOAT
SET @faturamentoProduto = @quantidadeProduto * @precoProduto

SELECT @Produto AS 'Produto',
@quantidadeProduto AS 'Quantidade',
@precoProduto AS 'Pre�o',
@faturamentoProduto AS 'Faturamento';

GO
-- 3

DECLARE @nomeUsuario AS VARCHAR(50)
SET @nomeUsuario = 'Andr�'
DECLARE @dataNascimento AS DATE
SET @dataNascimento = '1998-02-10'
DECLARE @numPets  AS INT
SET @numPets =  2

DECLARE @resultadoConcatenacao AS VARCHAR(100)

SET @resultadoConcatenacao = 'Meu nome � ' + @nomeUsuario + ', nasci em ' + FORMAT(@dataNascimento, 'dd/MM/yyyy') + ' e tenho ' + CAST(@numPets AS VARCHAR) + ' pets.'

PRINT @resultadoConcatenacao

GO
-- 4
SELECT * FROM DimStore
WHERE CloseReason IS NOT NULL AND YEAR(CloseDate) = 2008;


DECLARE @resultadoFalencia VARCHAR(MAX)
SET @resultadoFalencia = 'Lojas fechadas em 2008:'

SELECT @resultadoFalencia = @resultadoFalencia + CHAR(13) + CHAR(10) + ' - ' + StoreName + ' (Fechada em: ' + CONVERT(VARCHAR, CloseDate, 103) + ', Motivo: ' + CloseReason + ')'
FROM DimStore
WHERE CloseReason IS NOT NULL AND YEAR(CloseDate) = 2008

PRINT ISNULL(@resultadoFalencia, 'Nenhuma loja fechada em 2008')

GO
-- 5

SELECT * FROM DimProductSubcategory
DECLARE @id_subcategoria INT
DECLARE @subcategoria VARCHAR(100)
SET @subcategoria = 'Radio'
SET @id_subcategoria = (SELECT ProductSubcategoryKey FROM DimProductSubcategory WHERE ProductSubcategoryName = @subcategoria)
SELECT * FROM DimProduct WHERE ProductSubcategoryKey = @id_subcategoria

GO

SELECT LEN ('SQL DEV         ') AS LEN,
DATALENGTH ('SQL DEV          ') AS DATALENGTH;

SELECT FirstName AS 'Nome',
LastName as 'Sobrenome', 
EmailAddress AS 'E-mail',
CONCAT (FirstName, ' ', LastName) AS 'Nome Completo'
FROM DimCustomer;


SELECT ProductName AS 'Produto',
UnitPrice AS 'Pre�o',
LEFT(StyleName, 7) AS 'C�d 1',
RIGHT(StyleName, 7) AS 'C�d 2'
FROM DimProduct;

SELECT CONCAT (FirstName, ' ', LastName) AS 'Nome Completo',
Gender AS 'Sexo (Abrev)',
REPLACE (REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'Sexo (Extenso)'
FROM DimCustomer;

GO

CREATE DATABASE Teste;
USE Teste;

CREATE TABLE Clientes(
Nome VARCHAR (255),
Telefone VARCHAR(20));

INSERT INTO Clientes (Nome, Telefone) VALUES
('Jo�o da Silva', '(11) 98765-4321'),
('Maria Oliveira', '11.98765.4321'),
('Carlos Pereira', '11 98765 4321'),
('Ana Souza', '11-98765-4321');

SELECT TRANSLATE(Telefone, '().- ', '     ') AS telefone_padronizado FROM Clientes;


-- STUFF STRING_ORIGINAL, POSI��O_INICIAL, QUANTIADADE_DE_CARACTERES_PARA_REMOVER, NOVA_STRING
-- STRING_ORIGINAL: STRING QUE SER� ALTERADA
-- POSI��O_INICIAL: POSIC�O ONDE COME�AR A MODIFICA��O
-- QUANTIADADE_DE_CARACTERES_PARA_REMOVER: QUANTOS CARACTRES SER� EXCLU�DOS
-- NOVA_STRING: O TEXTO QUE SER� INSERIDO

SELECT STUFF ('Ol� Pessoal', 5, 7, 'Amigo') AS Resultado;

SELECT STUFF('12345678', 6 , 0, '-') AS 'CEP_Formatado';

SELECT STUFF(STUFF('11988887777', 8 , 0, '-'), 3, 0, ' ') AS Telefone_Formatado;

SELECT STUFF(STUFF(STUFF('11988887777', 3 , 0, ') '), 1, 0, '('), 11, 0, '-') AS Telefone_Formatado;

GO

USE ContosoRetailDW;

SELECT 
UPPER(FirstName) AS 'NOME',
LOWER(FirstName) AS 'nome',
EmailAddress AS 'E-mail'
FROM DimCustomer;

SELECT 'Raquel Moreno' AS 'Nome'
SELECT CHARINDEX('Moreno', 'Raquel Moreno') AS 'Posi��o Sobrenome' -- Retorna posi��o do caractere
SELECT SUBSTRING('Raquel Moreno', 8, 6) as 'Sobrenome'  -- 8 = posi��o inicial, 6 = qtde. de caracteres a ser extra�do

DECLARE @varCodigo VARCHAR(50)
SET @varCodigo = '     ABC     '
SELECT
TRIM (@varCodigo) AS 'Trim',
LTRIM (@varCodigo) AS 'Ltrim',
RTRIM (@varCodigo) AS 'Rtrim';

DECLARE @varData DATETIME
SET @varData = '18/05/2020'
SELECT
DAY (@varData) AS 'Dia',
MONTH (@varData) AS 'M�s',
YEAR (@varData) AS 'Ano';

DECLARE @varDia INT, @varMes INT, @varAno INT
SET @varDia = 29
SET @varMes = 12
SET @varAno = 2020
SELECT DATEFROMPARTS (@varAno, @varMes, @varDia ) AS 'Data';


-- DATA E HORA DO BANCO DE DADOS, MUITO �TIL EM TRANSA��ES FINANCEIRAS

SELECT GETDATE()

SELECT SYSDATETIME()



-- DATENAME E DATEPART RETORNAM INFORMA��ES DE UMA DATA COMO M�S, ANO, TRIMESTRE E POR A� VAI
-- NECESSITA DO SEGUINTE
-- 1. INFORMA��O DA DATA 
-- 2. DATA

SELECT 
DATENAME(DAY, '2017/08/25') AS 'Dia',
DATENAME(DAYOFYEAR, '2017/08/25') AS 'Dia do ano',
DATENAME(DW, '2017/08/25') AS 'Dia da semana',
DATENAME(QUARTER, '2017/08/25') AS 'Trimestre',
DATENAME(YY, '2017/08/25') AS 'Ano';

---- DATEADD E DATEDIFF SERVEM PARA CALCULOS COM AS DATAS ----

--- DATEADD ADICIONA OU SUBTRAI DIAS, MESES OU ANOS
-- 1. INTERVALO DE TEMPO PARA CONSIDERAR (DIA, MES, ANO)
-- 2. QUANTIDADE DE INTERVALOS PARA CONSIDERAR
-- 3. DATA NA QUAL VAI SER ADICIONADO OU SUBTRAIDO OS RESULTADOS

--- DATEDIFF
-- 1. INTERVALO QUE QUEREMOS SUBTRAIR(DIA, MES, ANO)
-- 2. DATA 1 A SER CONSIDERADA NO CALCULO
-- 3. DATA 2 A SER CONSIDERADA NO CALCULO

DECLARE @varData1 DATETIME, @varData2 DATETIME, @varData3 DATETIME
SET @varData1 = '10/07/2020'
SET @varData2 = '05/03/2020'
SET @varData3 = '14/11/2020'

-- DATEADD
SELECT
DATEADD (MONTH, -1, @varData1) AS 'DateAdd'

-- DATEDIFF
SELECT
DATEDIFF (DAY, @varData2, @varData3) AS 'DateDiff'

GO 
-- EX 1 Quando estamos manipulando tabelas, � importante pensar em como os dados 
-- ser�o apresentados em um relat�rio. Imagine os nomes dos produtos da tabela 
-- DimProduct. Os textos s�o bem grandes e pode ser que mostrar os nomes 
-- completos dos produtos n�o seja a op��o mais interessante, pois 
-- provavelmente n�o v�o caber em um gr�fico e a visualiza��o ficar� ruim. 

-- 1A Seu gestor te pede para listar todos os produtos para que seja criado um 
-- gr�fico para ser apresentado na reuni�o di�ria de equipe. Fa�a uma 
-- consulta � tabela DimProduct que retorne (1) o nome do produto e (2) a 
-- quantidade de caracteres que cada produto tem, e ordene essa tabela 
-- do produto com a maior quantidade de caracteres para a menor. 

SELECT * FROM DimProduct;

SELECT ProductName AS [Nome Produto], LEN (ProductName) AS [Qtde. Caracteres] 
FROM DimProduct
ORDER BY [Qtde. Caracteres] DESC;

GO
-- 1B Qual � a m�dia de caracteres dos nomes dos produtos? 
SELECT AVG(LEN(ProductName)) AS [M�dia de Caracteres]
FROM DimProduct;

GO
-- 1C Analise a estrutura dos nomes dos produtos e verifique se seria poss�vel
-- reduzir o tamanho do nome dos produtos. (Dica: existem informa��es 
-- redundantes nos nomes dos produtos? 
-- Seria poss�vel substitu�-las?) 
SELECT
ProductName, BrandName, ColorName,
REPLACE(REPLACE(ProductName, BrandName, ' '),ColorName, '') AS 'Sem Informa��es'
FROM DimProduct;

GO
-- 1D Qual � a m�dia de caracteres nesse novo cen�rio?
SELECT
AVG (LEN (REPLACE (REPLACE(ProductName, BrandName, ' '),ColorName, ''))) AS [M�dia Tamanho Sem Informa��es]
FROM DimProduct;


GO
-- 2 A coluna StyleName da tabela DimProduct possui alguns c�digos 
-- identificados por n�meros distintos, que v�o de 0 at� 9, como pode ser visto no 
-- exemplo abaixo. 
-- Por�m, o setor de controle decidiu alterar a identifica��o do StyleName, e em vez 
-- de usar n�meros, a ideia agora � passar a usar letras para substituir os n�meros, 
-- conforme exemplo abaixo: 
-- 0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J 
-- � de sua responsabilidade alterar os n�meros por letras na coluna StyleName da 
-- tabela DimProduct. Utilize uma fun��o que permita fazer essas substitui��es de 
-- forma pr�tica e r�pida


SELECT * FROM DimProduct;

SELECT TRANSLATE(StyleName, '0, 1, 2, 3, 4, 5, 6, 7, 8, 9', 'A, B, C, D, E, F, G, H, I, J') AS 'C�digo Formatado' FROM DimProduct;

GO
/* 3 O setor de TI est� criando um sistema para acompanhamento individual de 
cada funcion�rio da empresa Contoso. Cada funcion�rio receber� um login e 
senha. O login de cada funcion�rio ser� o ID do e-mail, como no exemplo 
abaixo: 
EmailAddress
guy1@contoso.com
devin0@contoso.com
roberto0@contoso.com
kirkNason@contoso.com
J� a senha ser� o FirstName + o dia do ano em que o funcion�rio nasceu, em 
MAI�SCULA. Por exemplo, o funcion�rio com E-mail: mark0@contoso.com e 
data de nascimento 15/01/1990 dever� ter a seguinte senha: 
Login: mark0 
Senha: MARK15 
O respons�vel pelo TI pediu a sua ajuda para retornar uma tabela contendo as 
seguintes colunas da tabela DimEmployee: Nome completo (FirstName + 
LastName), E-mail, ID do e-mail e Senha. 
Portanto, fa�a uma consulta � tabela DimProduct e retorne esse resultado. */

SELECT * FROM DimEmployee;

SELECT
CONCAT(FirstName, ' ',LastName) AS 'Nome Completo',
EmailAddress AS 'Endere�o email',
SUBSTRING(EmailAddress, 1, CHARINDEX('@',EmailAddress) - 1) AS 'ID E-mail',
UPPER (FirstName + DATENAME(DAYOFYEAR, BirthDate)) AS 'Senha'
FROM DimEmployee;

GO
/* 4. A tabela DimCustomer possui o primeiro registro de vendas no ano de 2001. 
Como forma de reconhecer os clientes que compraram nesse ano, o setor de 
Marketing solicitou a voc� que retornasse uma tabela com todos os clientes que 
fizeram a sua primeira compra neste ano para que seja enviado uma encomenda 
com um presente para cada um. 
Para fazer esse filtro, voc� pode utilizar a coluna DateFirstPurchase, que cont�m 
a informa��o da data da primeira compra de cada cliente na tabela DimCustomer. 
Voc� dever� retornar as colunas de FirstName, EmailAddress, AddressLine1 e 
DateFirstPurchase da tabela DimCustomer, considerando apenas os clientes que 
fizeram a primeira compra no ano de 2001.
 */
 SELECT FirstName, EmailAddress, AddressLine1, DateFirstPurchase FROM DimCustomer WHERE YEAR(DateFirstPurchase) = 2001;

 GO
 /* 5.
 A tabela DimEmployee possui uma informa��o de data de contrata��o 
(HireDate). A �rea de RH, no entanto, precisa das informa��es dessas datas de 
forma separada em dia, m�s e ano, pois ser� feita uma automatiza��o para 
cria��o de um relat�rio de RH, e facilitaria muito se essas informa��es 
estivessem separadas em uma tabela. 
Voc� dever� realizar uma consulta � tabela DimEmployee e retornar uma tabela 
contendo as seguintes informa��es: FirstName, EmailAddress, HireDate, al�m 
das colunas de Dia, M�s e Ano de contrata��o. 
Obs1: A coluna de M�s deve conter o nome do m�s por extenso, e n�o o 
n�mero do m�s. 
Obs2: Lembre-se de nomear cada uma dessas colunas em sua consulta para 
garantir que o entendimento de cada informa��o ficar� 100% claro.
 */

SELECT FirstName AS 'Nome', EmailAddress AS 'Endere�o E-mail',
DAY(HireDate) AS 'Dia Contrata��o',
DATENAME(mm, HireDate) AS 'M�s Contrata��o',
DATENAME(YY, HireDate) AS 'Ano Contrata��o'
FROM DimEmployee;

GO
/*6 Descubra qual � a loja que possui o maior tempo de atividade (em dias). Voc� 
dever� fazer essa consulta na tabela DimStore, e considerar a coluna OpenDate 
como refer�ncia para esse c�lculo.
*/

SELECT TOP 1 StoreKey, StoreName, DATEDIFF (DAY, OpenDate, GETDATE()) AS 'Dias em atividade'
FROM DimStore ORDER BY 'Dias em atividade' DESC;

GO
/* 7  Utilizando os comandos STUFF, REPLACE, TRANSLATE e LEFT, 
fa�a uma consulta na tabela Clientes da base de dados teste, para que todos os 
n�meros de telefone sejam corretamente formatados, exemplo: (11) 98765-4321
*/

SELECT Nome, Telefone, 
STUFF(STUFF(REPLACE(TRANSLATE(Telefone, '().-', '    '), ' ', ''), 1, 2, '(' + 
LEFT (REPLACE(TRANSLATE(Telefone, '().-', '    '), ' ', ''), 2) + ')'), 9, 0, '-') AS Telefone_Padronizado
FROM Clientes;

GO
-- EXEMPLO IF


IF @idade >= 18
BEGIN 
PRINT 'Maior de idade';
END
ELSE
BEGIN
PRINT 'Menor de idade';
END

SELECT IIF(@idade >= 18, 'Maior de idade', 'Menor de idade'); 

 GO
-- CASE

SELECT CustomerKey, FirstName, Gender,
CASE WHEN Gender = 'M' THEN 'Masculino'
ELSE 'Feminino'
END AS 'Sexo'
FROM DimCustomer;


SELECT CustomerKey, FirstName, Gender,
CASE WHEN Gender = 'M' THEN 'Masculino'
WHEN Gender = 'F' THEN 'Feminino'
ELSE 'Empresa'
END AS 'Sexo'
FROM DimCustomer;

SELECT ProductName,BrandName, ColorName, UnitPrice,
CASE WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN 0.10
ELSE 0 
END AS 'Desconto'
FROM DimProduct;

SELECT ProductName,BrandName, ColorName, UnitPrice,
CASE WHEN BrandName = 'Contoso' OR BrandName = 'Fabrikam' THEN 0.10
ELSE 0 
END AS 'Desconto'
FROM DimProduct;

SELECT StoreKey, StoreName, StoreType, Status, EmployeeCount,
CASE
WHEN EmployeeCount >= 40 THEN
CASE
WHEN Status = 'Off' THEN 'LOJA FECHADA: Acima de 40 funcion�rios'
WHEN Status = 'On' THEN 'LOJA ABERTA: Acima de 40 funcion�rios'
END
WHEN EmployeeCount >= 30 THEN 'Entre 30 e 29 funcion�rios'
WHEN EmployeeCount >= 20 THEN 'Entre 20 e 29 funcion�rios'
ELSE 'Abaixo de 19 funcion�rios'
END AS 'Categoria'
FROM DimStore;


SELECT ProductKey, ProductName, ProductCategoryName, ProductSubcategoryName, UnitPrice,
CASE WHEN ProductCategoryName = 'TV and Video'
THEN 0.10 ELSE 0.00 END
+ CASE WHEN ProductSubcategoryName = 'Televisions'
THEN 0.05 ELSE 0.00 END
FROM DimProduct
INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;


DECLARE @varClassificacao INT
SET @varClassificacao = 2
SELECT IIF(@varClassificacao >= 5,
'Risco Alto',
'Risco Baixo') AS 'Status';


SELECT ProductKey, ProductName, StockTypeName, 
IIF(StockTypeName = 'High',
'Jo�o',
 IIF (StockTypeName = 'Mid',
'Maria',
'Luis')) AS 'Respons�vel'
FROM DimProduct;

SELECT * FROM DimProduct;


SELECT GeographyKey, ContinentName, CityName, ISNULL(CityName, 'Local desconhecido')
FROM DimGeography;

GO
/*1. O setor de vendas decidiu aplicar um desconto aos produtos de acordo com a sua classe. O 
percentual aplicado dever� ser de:
Economy -> 5%
Regular -> 7%
Deluxe -> 9%
*/
SELECT ProductKey, ProductName,
CASE WHEN ClassName = 'Economy'THEN 0.05
WHEN ClassName = 'Regular' THEN 0.07
ELSE 0.09 END
FROM DimProduct;

GO
/*
a) Fa�a uma consulta � tabela DimProduct que retorne as seguintes colunas: ProductKey, 
ProductName, e outras duas colunas que dever�o retornar o % de Desconto e UnitPrice com 
desconto. 
*/
SELECT * FROM DimProduct;

SELECT ProductKey, ProductName, 
CASE WHEN ClassName = 'Economy' THEN 0.05
WHEN ClassName = 'Regular' THEN 0.07
ELSE 0.09 
END AS PorcentagemDesconto,
UnitPrice * (1 - CASE WHEN ClassName = 'Economy' THEN 0.05
WHEN ClassName = 'Regular' THEN 0.07
ELSE 0.09 
END) AS Pre�oComDesconto
FROM DimProduct;

GO
/*
b) Fa�a uma adapta��o no c�digo para que os % de desconto de 5%, 7% e 9% sejam facilmente 
modificados (dica: utilize vari�veis).
*/
DECLARE @Economy AS FLOAT
SET @Economy = 0.05
DECLARE @Regular AS FLOAT
SET @Regular = 0.07
DECLARE @Deluxe AS FLOAT
SET @Deluxe = 0.09
SELECT ProductKey, ProductName, 
CASE WHEN ClassName = 'Economy' THEN (1 - @Economy)
WHEN ClassName = 'Regular' THEN (1- @Regular)
ELSE (1 - @Deluxe)
END AS PorcentagemDesconto,
UnitPrice * (1 - CASE WHEN ClassName = 'Economy' THEN @Economy
WHEN ClassName = 'Regular' THEN @Regular
ELSE @Deluxe
END) AS Pre�oComDesconto
FROM DimProduct;

GO
/* 2. Voc� ficou respons�vel pelo controle de produtos da empresa e dever� fazer uma an�lise da 
quantidade de produtos por Marca.
A divis�o das marcas em categorias dever� ser a seguinte:
CATEGORIA A: Mais de 500 produtos 
CATEGORIA B: Entre 100 e 500 produtos 
CATEGORIA C: Menos de 100 produtos 
Fa�a uma consulta � tabela DimProduct e retorne uma tabela com um agrupamento de Total de 
Produtos por Marca, al�m da coluna de Categoria, conforme a regra acima.
*/
SELECT * FROM DimProduct;
SELECT BrandName, COUNT(ProductKey) AS TotalProdutos,
CASE WHEN COUNT(ProductKey) > 500 THEN 'CATEGORIA A'
WHEN COUNT(ProductKey) BETWEEN 100 AND 500 THEN 'CATEGORIA B'
ELSE 'CATEGORIA C'
END AS Categoria
FROM DimProduct
GROUP BY BrandName;

GO
/* 3. Ser� necess�rio criar uma categoriza��o de cada loja da empresa considerando a quantidade de 
funcion�rios de cada uma. A l�gica a ser seguida ser� a l�gica abaixo:
EmployeeCount >= 50; 'Acima de 50 funcion�rios'
EmployeeCount >= 40; 'Entre 40 e 50 funcion�rios'
EmployeeCount >= 30; 'Entre 30 e 40 funcion�rios'
EmployeeCount >= 20; 'Entre 20 e 30 funcion�rios'
EmployeeCount >= 40; 'Entre 10 e 20 funcion�rios'
Caso contr�rio: 'Abaixo de 10 funcion�rios'
Fa�a uma consulta � tabela DimStore que retorne as seguintes informa��es: StoreName, 
EmployeeCount e a coluna de categoria, seguindo a regra acima.
*/
SELECT * FROM DimEmployee;

SELECT StoreName, EmployeeCount,
CASE WHEN EmployeeCount >= 50 THEN 'Acima de 50 funcion�rios'
WHEN EmployeeCount >= 40 THEN 'Entre 40 e 50 funcion�rios'
WHEN EmployeeCount >= 30 THEN 'Entre 30 e 40 funcion�rios'
WHEN EmployeeCount >= 20 THEN 'Entre 20 e 30 funcion�rios'
WHEN EmployeeCount >= 10 THEN 'Entre 10 e 20 funcion�rios'
ELSE 'Abaixo de 10 funcion�rios'
END AS Categoria
FROM DimStore;

GO
/* 4. O setor de log�stica dever� realizar um transporte de carga dos produtos que est�o no dep�sito 
de Seattle para o dep�sito de Sunnyside. 
N�o se tem muitas informa��es sobre os produtos que est�o no dep�sito, apenas se sabe que 
existem 100 exemplares de cada Subcategoria. Ou seja, 100 laptops, 100 c�meras digitais, 100 
ventiladores, e assim vai.
O gerente de log�stica definiu que os produtos ser�o transportados por duas rotas distintas. Al�m 
disso, a divis�o dos produtos em cada uma das rotas ser� feita de acordo com as subcategorias (ou 
seja, todos os produtos de uma mesma subcategoria ser�o transportados pela mesma rota):
Rota 1: As subcategorias que tiverem uma soma total menor que 1000 kg dever�o ser 
transportados pela Rota 1.
Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 1000 kg dever�o ser 
transportados pela Rota 2.
Voc� dever� realizar uma consulta � tabela DimProduct e fazer essa divis�o das subcategorias por 
cada rota. Algumas dicas:
- Dica 1: A sua consulta dever� ter um total de 3 colunas: Nome da Subcategoria, Peso Total e Rota.
- Dica 2: Como n�o se sabe quais produtos existem no dep�sito, apenas que existem 100 
exemplares de cada subcategoria, voc� dever� descobrir o peso m�dio de cada subcategoria e 
multiplicar essa m�dia por 100, de forma que voc� descubra aproximadamente qual � o peso total
dos produtos por subcategoria.
- Dica 3: Sua resposta final dever� ter um JOIN e um GROUP BY.
*/
SELECT p.ProductSubcategoryKey AS 'Subcategoria',
SUM(p.Weight) * 100 AS 'Peso Total',
CASE WHEN SUM(p.Weight) < 1000 THEN 'Transportados pela Rota 1'
WHEN SUM(p.Weight) >= 1000 THEN 'Transportados pela Rota 2'
END AS 'Rota'
FROM DimProduct p
GROUP BY p.ProductSubcategoryKey
ORDER BY p.ProductSubcategoryKey;

GO
/* 5. O setor de marketing est� com algumas ideias de a��es para alavancar as vendas em 2021. Uma 
delas consiste em realizar sorteios entre os clientes da empresa. 
Este sorteio ser� dividido em categorias:
�Sorteio M�e do Ano�: Nessa categoria v�o participar todas as mulheres com filhos.
�Sorteio Pai do Ano�: Nessa categoria v�o participar todos os pais com filhos.
�Caminh�o de Pr�mios�: Nessa categoria v�o participar todas os demais clientes (homens e 
mulheres sem filhos).
Seu papel ser� realizar uma consulta � tabela DimCustomer e retornar 3 colunas:
- FirstName AS �Nome�
- Gender AS �Sexo�
- TotalChildren AS �Qtd. Filhos�
- EmailAdress AS �E-mail�
- A��o de Marketing: nessa coluna voc� dever� dividir os clientes de acordo com as categorias 
�Sorteio M�e do Ano�, �Sorteio Pai do Ano� e �Caminh�o de Pr�mios�
*/
SELECT FirstName AS Nome, 
Gender AS Sexo, 
TotalChildren AS [Qtd. Filhos], 
EmailAddress AS [E-mail],
CASE WHEN Gender = 'F' AND TotalChildren > 0 THEN 'Sorteio M�e do Ano'
WHEN Gender = 'M' AND TotalChildren > 0 THEN 'Sorteio Pai do Ano'
ELSE 'Caminh�o de Pr�mios'
END AS [A��o de Marketing]
FROM DimCustomer;


GO
/* 6. Descubra qual � a loja que possui o maior tempo de atividade (em dias). Voc� dever� fazer essa 
consulta na tabela DimStore, e considerar a coluna OpenDate como refer�ncia para esse c�lculo.
Aten��o: lembre-se que existem lojas que foram fechadas
*/

SELECT TOP 1 StoreName, 
DATEDIFF(DAY, OpenDate, 
CASE WHEN CloseDate IS NOT NULL THEN CloseDate 
ELSE GETDATE() 
END) AS TempoAtividadeDias
FROM DimStore
ORDER BY TempoAtividadeDias DESC;


GO

------------------------------------------------- BANCO DE DADOS UNIVERSIDADE S�O GABRIEL ----------------------------------------------------------
CREATE DATABASE UniversidadeSaoGabriel;
USE UniversidadeSaoGabriel;

GO

CREATE TABLE Alunos (
RA_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome_aluno VARCHAR(50) NOT NULL,
sobrenome_aluno VARCHAR(100) NOT NULL,
data_nascimento DATE NOT NULL,
genero ENUM('M', 'F', 'O'),  
CPF CHAR(11) UNIQUE NOT NULL,  
RG VARCHAR(15) UNIQUE,  
rua VARCHAR(100) NOT NULL,
numero_residencial VARCHAR(10) NOT NULL, 
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
CEP CHAR(8) NOT NULL,
telefone_celular VARCHAR(20) NOT NULL,
telefone_residencial VARCHAR(20),
telefone_comercial VARCHAR(20),
telefone_recado VARCHAR(20),
email_pessoal VARCHAR(60) NOT NULL,
email_corporativo VARCHAR(60),
status_aluno ENUM ('ativo', 'formado', 'trancado', 'transferido') NOT NULL,
data_ingresso DATE NOT NULL,
deficiencia ENUM ('S', 'N') NOT NULL, 
tipo_deficiencia VARCHAR(100),
nome_mae VARCHAR(100),
nome_pai VARCHAR(100)
);

CREATE TABLE Professor (
cod_professor INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
nome_professor VARCHAR(50) NOT NULL,
sobrenome_professor VARCHAR(100) NOT NULL,
data_nascimento DATE NOT NULL,
identificacao_genero ENUM ('M', 'F', 'O'),
data_contrata��o DATE,
tipo_vinculo ENUM ('efetivo', 'substituto', 'temporario'),
CPF CHAR(11) UNIQUE NOT NULL,  
RG VARCHAR(15) UNIQUE, 
titula��o ENUM ('graduado', 'mestre', 'doutor'),
rua VARCHAR(100) NOT NULL,
n�mero_residencial VARCHAR(10) NOT NULL,
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
CEP CHAR(8) NOT NULL,
telefone_celular VARCHAR (20),
telefone_residencial VARCHAR (20),
telefone_comercial VARCHAR (20),
telefone_recado VARCHAR (20),
email_pessoal VARCHAR (60),
email_corporativo VARCHAR (60),
FOREIGN KEY (cod_departamento) REFERENCES Departamento (cod_departamento),
status_professor ENUM ('ativo', 'inativo', 'licenciado')
);

CREATE TABLE Curso (
cod_curso INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
nome_curso VARCHAR (60),
tipo ENUM ('bacharelado', 'licenciatura', 'tecn�logo'),
duracao_meses INT,
cod_departamento INT AUTO_INCREMENT,
turno ENUM ('matutino', 'vespertino', 'noturno'),
carga_horaria_total INT,
modalidade ENUM ('presencial', 'semi-presencial', 'EAD'),
cod_prof_coordenador FOREIGN KEY -- ATEN�AO
);

CREATE TABLE Departamento (
cod_departamento INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
nome_departamento VARCHAR (100)
);

CREATE TABLE Disciplina(
cod_disciplina INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
nome_disciplina VARCHAR (30),
pre_requisitos VARCHAR (100),
ementa VARCHAR (150), -- resumo do conteudo abordado ao longo do curso
FOREIGN KEY (cod_departamento) REFERENCES Departamento (cod_departamento),
carga_horaria INT,
FOREIGN KEY (cod_curso) REFERENCES Turma (cod_turma)
);

CREATE TABLE Historico (
cod_historico INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
FOREIGN KEY cod_disciplina REFERENCES Disciplina (cod_disciplina),
FOREIGN KEY RA_Aluno REFERENCES Alunos (RA_Aluno),
ano YEAR,
semestre INT,
nota FLOAT,
frequencia FLOAT,
situacao ENUM ('aprovado', 'reprovado', 'trancado')
);

CREATE TABLE TURMA (
cod_turma INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
cod_curso INT,
sala VARCHAR (20),
ano YEAR,
semestre INT,
FOREIGN KEY cod_disciplina REFERENCES Disciplina (cod_disciplina),
FOREIGN KEY cod_professor REFERENCES Professor (cod_professor),
periodo INT,
num_alunos INT,
data_inicio DATE,
data_fim DATE
);

CREATE TABLE Matricula (
cod_matricula INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
FOREIGN KEY RA_Aluno REFERENCES Alunos (RA_Aluno),
FOREIGN KEY cod_turma REFERENCES Turma (cod_turma),
data_matricula DATE,
data_cancelamento DATE,
status_matricula ENUM ('ativa', 'cancelada', 'trancada')
);

