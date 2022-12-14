DROP TABLE IF EXISTS funcionario
DROP TABLE IF EXISTS cliente
DROP TABLE IF EXISTS carro
DROP TABLE IF EXISTS venda
DROP TABLE IF EXISTS proposta

CREATE TABLE funcionario (
    codFuncionario int NOT NULL,
    nome varchar(100) NOT NULL,
    cpf varchar(11) UNIQUE,
    dataNascimento date,
    login varchar(20) NOT NULL,
    senha varchar(20) NOT NULL,
    salario float NOT NULL,
    cargaHoraria int,
    CONSTRAINT "funcionarioPK" PRIMARY KEY (codfuncionario));
    
CREATE TABLE cliente (
    codCliente int NOT NULL,
    nome varchar(100) NOT NULL,
    cpf varchar(11) UNIQUE,
    dataNascimento date,
    telefone int,
    endereco varchar(50),
    email varchar,
    CONSTRAINT "clientePK" PRIMARY KEY (codcliente));
    
CREATE TABLE carro (
    codCarro int NOT NULL,
    marca varchar,
    modelo varchar,
    anoFabricacao int,
    valor float NOT NULL,
    CONSTRAINT "carroPK" PRIMARY KEY (codcarro));  

CREATE TABLE venda (
	codVenda serial,
	codCarro int,
	anoFabricacao int,
	valorVenda float NOT NULL,
	codFuncionario int NOT NULL,
	codCliente int NOT NULL,
	CONSTRAINT "vendaPK" PRIMARY KEY (codvenda),
	CONSTRAINT "CarroVendaFK" FOREIGN KEY(codcarro) REFERENCES carro(codcarro),
	CONSTRAINT "FuncionarioVendaFK" FOREIGN KEY(codfuncionario) REFERENCES funcionario(codfuncionario),
	CONSTRAINT "ClienteVendaFK" FOREIGN KEY(codcliente) REFERENCES cliente(codcliente))

CREATE TABLE proposta (
	codProposta int,
	codCarro int,
	codFuncionario int,
	codCliente int,
	valorInicial int,
	valorFinal int, 
	dataVenda date, 
	CONSTRAINT "PropostaPK" PRIMARY KEY (codproposta),
	CONSTRAINT "CarroPropostaFK" FOREIGN KEY(codcarro) REFERENCES carro(codcarro),
	CONSTRAINT "FuncionarioPropostaFK" FOREIGN KEY(codfuncionario) REFERENCES funcionario(codfuncionario),
	CONSTRAINT "ClientePropostaFK" FOREIGN KEY(codcliente) REFERENCES cliente(codcliente))
	
INSERT INTO funcionario (codfuncionario, nome, cpf, datanascimento, login, senha, salario, cargahoraria) VALUES 
(001, 'Louis Tomlinson', 28214672911, to_date('24/12/1991','DD/MM/YYYY'), 'aluisio', 'walls28', 56578, 30),
(002, 'Harry Styles', 85381630923, to_date('01/02/1993','DD/MM/YYYY'), 'harold', 'medicine', 56300, 30),
(003, 'Niall Horan', 27400912335, to_date('13/09/1993','DD/MM/YYYY'), 'nai', 'azul', 55400, 30),
(004, 'Zayn Malik', 46297439222, to_date('12/01/1993','DD/MM/YYYY'), 'zain', 'goodyears', 56120, 32),
(005, 'Liam Payne', 16382929963, to_date('29/08/1992','DD/MM/YYYY'), 'payno', 'rudehours13', 54700, 29),
(006, 'Taylor Swift', 13131678771, to_date('13/12/1989','DD/MM/YYYY'), 'taylor', 'august13', 62800, 25),
(007, 'James Bond', 18945678203, to_date('16/05/1953', 'DD/MM/YYYY'), 'bondbond', 'eujamesbond7', 40000, 30),
(008, 'Anne Hathaway', 94587326045, to_date('12/11/1982', 'DD/MM/YYYY'), 'anneh', 'getreal02', 55000, 28);


INSERT INTO cliente (codcliente, nome, cpf, datanascimento, telefone, endereco, email) VALUES
(101, 'V??nia Tanz??nia', 23458510283, to_date('22/12/1987','DD/MM/YYYY'), 977884345, 'rua greenwood, 3454', 'vaniat@gmail.com'),
(102, 'Romeu Jubileu', 78430935677, to_date('30/01/1990','DD/MM/YYYY'), 981234455, 'irere, 678', 'jubijubi@gmail.com'),
(103, 'Julieta Maria', 36284629364, to_date('04/06/2000','DD/MM/YYYY'), 923236490, 'nothing hill, 1309', 'jueta@gmail.com'),
(104, 'Virgulino Vastor', 45279173618, to_date('09/07/1973','DD/MM/YYYY'), 987864623, 'carpasinha, 4', 'virgulinho@gmail.com'),
(105, 'Joui Jouk', 32845193716, to_date('04/04/1994','DD/MM/YYYY'), 980456704, 'sao paolo, 4444', 'jouijouk@hotmail.com'),
(106, 'Rachel Green', 36294628777, to_date('12/01/1980','DD/MM/YYYY'), 978761234, 'central perk, 1000', 'rachelerosshotmail.com'),
(107, 'Milene Cardoso', 75733290954, to_date('01/10/2004','DD/MM/YYYY'), 99954320, 'Os??rio, 7777', 'micardoso7@gmail.com'),
(108, 'Thiago Fritz', 04607128366, to_date('24/09/1996','DD/MM/YYYY'), 97077079, 'sao paolo, 3333', 'fritz@gmail.com');


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


INSERT INTO venda (codCarro, codVenda, anoFabricacao, valorVenda, codfuncionario, codCliente) VALUES 
(092, 200, 2016, 65000, 001, 101 ),
(094, 201, 2022, 120000, 002, 102 ), 
(072, 203, 2007, 900000, 003, 103),
(073, 204, 1989, 85900, 004, 104),
(074, 205, 1995, 33900, 006, 105),
(088, 208, 2015, 74000, 008, 106),
(084, 206, 2020, 55500, 007, 107),
(079, 207, 2015, 797000, 008, 108),
(076, 209, 2001, 755000, 003, 103);


INSERT INTO proposta (codproposta, codCarro, codFuncionario, codCliente, valorInicial, valorFinal, dataVenda) VALUES
(02, 092, 001, 101, 67000, 65000, to_date('22/04/2022', 'DD/MM/YYYY')),
(03, 094, 002, 102, 122990, 120000, to_date('16/02/2020', 'DD/MM/YYYY')),
(04, 072, 003, 103, 950000, 900000, to_date('04/09/2019', 'DD/MM/YYYY')),
(05, 073, 004, 104, 85900, 85900, to_date('15/08/2018', 'DD/MM/YYYY')),
(06, 074, 006, 105, 33900, 33900, to_date('07/12/2020', 'DD/MM/YYYY')),
(07, 088, 008, 106, 75000, 74000, to_date('26/05/2020', 'DD/MM/YYYY')),
(08, 084, 007, 107 ,60000, 55500, to_date('30/06/2021', 'DD/MM/YYYY')),
(09, 079, 008, 108, 797000, 797000, to_date('21/10/2019', 'DD/MM/YYYY')),
(10, 076, 003, 103, 758000, 755000, to_date('12/02/2018', 'DD/MM/YYYY')); 



--Uma Consulta que envolva dados de pelo menos duas tabelas;
--Jun????o das tabelas funcionario e proposta, e mostra os funcion??rios que j?? fizeram uma proposta e quantas fizeram.
SELECT f.nome, count(codproposta) FROM funcionario f INNER JOIN proposta p
    ON f.codfuncionario=p.codfuncionario
    GROUP BY f.nome

--Uma Consulta que envolva dados de pelo menos duas tabelas e que
--necessite de uma jun????o externa;
--A consulta ?? uma jun????o de todos os carros cadastrados no sistema, tanto os vendidos como os que ainda n??o foram. 
SELECT dataVenda, modelo FROM carro c LEFT JOIN proposta p ON c.codCarro=p.codCarro;

--Uma consulta que envolva dados de pelo menos tr??s trabelas e agrupamento de dados.
--jun????o das tabelas cliente, carro e proposta, mostra quais clientes compraram, o nome dos carros comprados, 
--a quantidade de carros que cada cliente comprou, o valor total gasto de cada cliente 
--e o valor inicial do carro antes da proposta. ??? agrupado pelo nome do cliente e do carro. 

SELECT cli.nome, car.modelo, count(car.modelo) as quantidade, sum(valorfinal) as valor_proposta, sum(valorinicial) as valor 
FROM cliente cli LEFT JOIN proposta prop ON cli.codCliente = prop.codCliente
LEFT JOIN carro car ON car.codCarro = prop.codCarro
GROUP BY cli.nome, car.modelo
ORDER BY cli.nome ASC
