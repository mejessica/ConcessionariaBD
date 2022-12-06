DROP TABLE IF EXISTS funcionario
DROP TABLE IF EXISTS cliente
DROP TABLE IF EXISTS carro
DROP TABLE IF EXISTS venda
DROP TABLE IF EXISTS proposta

CREATE TABLE funcionario (
    codFuncionario int NOT NULL,
    nome varchar(100) NOT NULL,
    cpf varchar(11) UNIQUE,
    dataNascimento varchar,
    login varchar(20) NOT NULL,
    senha varchar(20) NOT NULL,
    salario float NOT NULL,
    cargaHoraria int,
	status varchar,
    CONSTRAINT "funcionarioPK" PRIMARY KEY (codfuncionario));
    
CREATE TABLE cliente (
    codCliente int NOT NULL,
    nome varchar(100) NOT NULL,
    cpf varchar(11) UNIQUE,
    dataNascimento varchar,
    telefone int,
    endereco varchar(50),
    email varchar,
	status varchar,
    CONSTRAINT "clientePK" PRIMARY KEY (codcliente));
    
CREATE TABLE carro (
    codCarro int NOT NULL,
    marca varchar,
    modelo varchar,
    anoFabricacao int,
    valor float NOT NULL,
    CONSTRAINT "carroPK" PRIMARY KEY (codcarro));  

CREATE TABLE venda (
	
	codVenda int,
	codCarro int,
	valorVenda float NOT NULL,
	codFuncionario int NOT NULL,
	codCliente int NOT NULL,
	CONSTRAINT "vendaPK" PRIMARY KEY (codvenda),
	CONSTRAINT "CarroVendaFK" FOREIGN KEY(codcarro) REFERENCES carro(codcarro) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	CONSTRAINT "FuncionarioVendaFK" FOREIGN KEY(codfuncionario) REFERENCES funcionario(codfuncionario)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	CONSTRAINT "ClienteVendaFK" FOREIGN KEY(codcliente) REFERENCES cliente(codcliente)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
);

CREATE TABLE proposta (
	
	codProposta int,
	codCarro int,
	codFuncionario int,
	codCliente int, 
	valorInicial float NOT NULL,
	valorVenda float NOT NULL, 
	status varchar,
	CONSTRAINT "PropostaPK" PRIMARY KEY (codproposta),
	CONSTRAINT "CarroPropostaFK" FOREIGN KEY(codcarro) REFERENCES carro(codcarro)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	CONSTRAINT "FuncionarioPropostaFK" FOREIGN KEY(codfuncionario) REFERENCES funcionario(codfuncionario)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	CONSTRAINT "ClientePropostaFK" FOREIGN KEY(codcliente) REFERENCES cliente(codcliente)
		ON DELETE SET NULL
		ON UPDATE CASCADE

);
	


--inserts
	
INSERT INTO funcionario (codfuncionario, nome, cpf, datanascimento, login, senha, salario, cargahoraria, status) VALUES 
(001, 'Louis Tomlinson', 28214672911, '24/12/1991', 'aluisio', 'walls28', 56578, 30, 'ativo'),
(002, 'Harry Styles', 85381630923, '01/02/1993', 'harold', 'medicine', 56300, 30, 'ativo'),
(003, 'Niall Horan', 27400912335, '13/09/1993', 'nai', 'azul', 55400, 30, 'ativo'),
(004, 'Zayn Malik', 46297439222, '12/01/1993', 'zain', 'goodyears', 56120, 32, 'ativo'),
(005, 'Liam Payne', 16382929963, '29/08/1992', 'payno', 'rudehours13', 54700, 29, 'ativo'),
(006, 'Taylor Swift', 13131678771,'13/12/1989', 'taylor', 'august13', 62800, 25, 'ativo'),
(007, 'James Bond', 18945678203, '16/05/1953', 'bondbond', 'eujamesbond7', 40000, 30, 'ativo'),
(008, 'Anne Hathaway', 94587326045, '12/11/1982', 'anneh', 'getreal02', 55000, 28, 'ativo');


INSERT INTO cliente (codcliente, nome, cpf, datanascimento, telefone, endereco, email, status) VALUES
(101, 'Vânia Tanzânia', 23458510283, '22/12/1987', 977884345, 'rua greenwood, 3454', 'vaniat@gmail.com', 'ativo'),
(102, 'Romeu Jubileu', 78430935677, '30/01/1990', 981234455, 'irere, 678', 'jubijubi@gmail.com', 'ativo'),
(103, 'Julieta Maria', 36284629364,'04/06/2000', 923236490, 'nothing hill, 1309', 'jueta@gmail.com', 'ativo'),
(104, 'Virgulino Vastor', 45279173618, '09/07/1973', 987864623, 'carpasinha, 4', 'virgulinho@gmail.com', 'ativo'),
(105, 'Joui Jouk', 32845193716, '04/04/1994', 980456704, 'sao paolo, 4444', 'jouijouk@hotmail.com', 'ativo'),
(106, 'Rachel Green', 36294628777, '12/01/1980', 978761234, 'central perk, 1000', 'rachelerosshotmail.com', 'ativo'),
(107, 'Milene Cardoso', 75733290954, '01/10/2004', 99954320, 'Osório, 7777', 'micardoso7@gmail.com', 'ativo'),
(108, 'Thiago Fritz', 04607128366, '24/09/1996', 97077079, 'sao paolo, 3333', 'fritz@gmail.com', 'ativo'),
(109, 'Kaiser Oliveira', 65309782111, '08/01/1998', 996543498, 'santo berço, 13', 'kaiserkaiser@hotmail.com', 'ativo'),
(110, 'Arthur Cervero', 89052187643, '04/05/1997', 995016267, 'carpazinha, 4590', 'tutui@gmail.com', 'ativo');

INSERT INTO carro (codCarro, marca, modelo, valor, anoFabricacao) VALUES
(070, 'Audi', 'R8', 1950000, 2007),
(071, 'Nissan', 'Skyline R34 Gtr', 1200000, 2000),
(072, 'Nissan', 'Skyline R35 Gtr', 950000, 2007),
(073, 'Mitsubishi', 'Eclipse', 85900, 1989),
(074, 'Honda', 'Civic EJ1', 33900, 1995),
(075, 'Volkswagen', 'Jetta Gli', 190000, 2019),
(076, 'BMW', 'M3 Gtr', 758000, 2001),
(077, 'Toyota', 'Supra', 350000, 2002),
(078, 'Audi', 'TT', 442900, 1998),
(079, 'Porsche', '911', 797000, 2015),
(080, 'Volkswagen', 'Gol quadrado', 9000, 2000),
(081, 'Fiat', 'Uno', 60000, 2017),
(082, 'Fiat', 'Palio Weekend', 44000, 20100),
(083, 'Nissan', '350z', 115000, 2001),
(084, 'VolksWagen', 'Fox', 60000, 2020),
(085, 'Peugeot', '208', 88990, 2012),
(086, 'Honda', 'Fit', 42900, 2013),
(087, 'Hyundai', 'HB20S 1.6', 51900, 2017),
(088, 'Ford',  'Fusion 2.0', 75000, 2015),
(089, 'Fiat', 'Cronos', 90390, 2022),
(090, 'Renault', 'Kwid', 68590, 2017), 
(091, 'Ford', 'Maverick', 120000, 1970),
(092, 'Fiat', 'Mobi', 67000, 2016),
(093, 'Jeep', 'Renegade', 100000, 2022),
(094, 'Suzuki', 'Jimny', 122990, 2022),
(095, 'Jeep', 'Wrangler Rubicon', 459990, 2022);


INSERT INTO venda (codCarro, codVenda, valorVenda, codfuncionario, codCliente) VALUES 
(092, 200, 65000, 001, 101 ),
(094, 201, 120000, 002, 102 ), 
(072, 203, 900000, 003, 103),
(073, 204, 85900, 004, 104),
(074, 205, 33900, 006, 105),
(088, 208, 74000, 008, 106),
(084, 206, 55500, 007, 107),
(079, 207, 797000, 008, 108),
(076, 209, 755000, 003, 103),
(094, 210, 120990, 007, 106),
(090, 211, 65590, 002, 102);


INSERT INTO proposta (codproposta, codCarro, codFuncionario, codCliente, valorInicial, valorVenda, status) VALUES
(302, 092, 001, 101, 67000, 65000, 'ativo'),
(303, 094, 002, 102, 122990, 120000, 'ativo'),
(304, 072, 003, 103, 950000, 900000, 'ativo'),
(305, 073, 004, 104, 85900, 85900, 'ativo'),
(306, 074, 006, 105, 33900, 33900, 'ativo'),
(307, 088, 008, 106, 75000, 74000, 'ativo'),
(308, 084, 007, 107 ,60000, 55500, 'ativo'),
(309, 079, 008, 108, 797000, 797000, 'ativo'),
(310, 076, 003, 103, 758000, 755000, 'ativo'),
(311, 094, 007, 106, 122990, 120990, 'ativo'),
(312, 090, 002, 102, 68590, 65590, 'ativo');



--Uma Consulta que envolva dados de pelo menos duas tabelas;
--Junção das tabelas funcionario e proposta, e mostra os funcionários que já fizeram uma proposta e quantas fizeram.
SELECT f.nome, count(codproposta) FROM funcionario f INNER JOIN proposta p
    ON f.codfuncionario=p.codfuncionario
    GROUP BY f.nome

--Uma Consulta que envolva dados de pelo menos duas tabelas e que
--necessite de uma junção externa;
--A consulta é uma junção de todos os carros cadastrados no sistema, tanto os vendidos como os que ainda não foram. 
SELECT valorVenda, modelo FROM carro c LEFT JOIN proposta p ON c.codCarro=p.codCarro;

--Uma consulta que envolva dados de pelo menos três trabelas e agrupamento de dados.
--exibe os dados de uma venda, como quem realizou a venda, quem realizou a compra, o que foi comprado e o valor gasto

SELECT ven.codVenda AS codigo_venda, fun.nome AS quem_vendeu, cli.nome AS quem_comprou, car.marca AS marca_veiculo, car.modelo AS modelo_veiculo, sum(valorVenda) AS valor_final
FROM cliente cli LEFT OUTER JOIN venda ven ON cli.codCliente = ven.codCliente
LEFT OUTER JOIN funcionario fun ON fun.codfuncionario = ven.codfuncionario
LEFT OUTER JOIN carro car ON car.codcarro = ven.codcarro
		GROUP BY (ven.codvenda, fun.nome, cli.nome, car.marca, car.modelo)
		ORDER BY (ven.codvenda);

--justificativa: o índice foi criado para ajudar na busca por carro, informando seu modelo
CREATE INDEX carro_nome ON carro(modelo)

--view que mostra todos os clientes, quantas vezes já compraram na loja e o total gasto
CREATE VIEW cliente_compras AS
	(SELECT c.codcliente, c.nome, count(codVenda) as compras, coalesce(sum(v.valorvenda), 0) as valorvenda
	 FROM cliente c FULL JOIN venda v USING (codcliente) 
	 GROUP BY c.codcliente
	 ORDER BY valorvenda desc)
	 
SELECT * FROM cliente_compras

drop view cliente_compras

select * from venda
