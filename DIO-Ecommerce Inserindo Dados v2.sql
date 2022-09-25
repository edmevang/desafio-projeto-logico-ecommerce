-- Inserção de dados e queries
use ecommerce;


desc clients;

show tables;

-- idClient, Fname, Minit, Lname, Address

insert into clients (Fname, Minit, Lname, CPF, Address)
		values('Maria', 'M', 'Silva', 12346789, 'R.Silva 29, Carangola - Cidade das flores' ), 
		    ('Matheus', 'O', 'Pimentel', 987654321, 'R.Alameda 289, Centro - Cidade das flores' ), 
		    ('Ricardo', 'F', 'Silva', 45678913, 'Av.Alam. Vinha 1009 , Centro - Cidade das flores' ), 
		    ('Julia', 'S', 'França', 789123456, 'R.Laranjeiras 861, Centro - Cidade das flores' ), 
		    ('Roberta', 'G', 'Assis', 98745631, 'Av Koller 19, Centro - Cidade das flores' ), 
		    ('Isabela', 'M', 'Cruz', 644789123, 'R.Alam. das Flores 28, Centro - Cidade das flores' );


select * from clients;

desc product;
-- idProduct, Fname, classification_kids boolean, category('Eletrônicos', 'Vestimentos', 'Brinquedos', 'Alimentos','Móveis'), avaliação, size

INSERT INTO product (Fname, classification_kids, category, avaliação, size)
  VALUES ('Fone de ouvido', false, 'Eletrônicos', 4, null),
  		('Barbie Elsa', true, 'Brinquedos', 3, null),
  		('Body Carters', true, 'Vestimentos', 5, null),
  		('Microfone Vedo - Youtuber', false, 'Eletrônicos', 4, null),
  		('Sofá retrátil', false, 'Móveis', 3, '3x57x80'),
  		('Farinha de arroz', false, 'Alimentos', 2, null),
  		('Fire Stick Amazon', false, 'Eletrônicos', 3, null);

select * from product;

desc orders;

delete from orders where idOrderClient in (1,2,3,4);

INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
			(1, default, 'compra via aplicativo', null, 1),
			(2, default, 'compra via aplicativo', 50, 0),
			(3, 'Confirmado', null, null, 1),
			(4, default, 'compra via web site', 150, 0);

select * from orders;

desc productOrder;

INSERT INTO productOrder (idOProduct, idPOorder, poQuantity, poStatus) VALUES
			(1,9,2,null),
			(2,9,1,null),
			(3,10,1,null);

select * from productOrder;


DESC productStorage;

INSERT INTO productStorage(storageLocation, quantity) VALUES
			('Rio de Janeiro', 1000),
			('Rio de Janeiro', 500),
			('São Paulo', 10),
			('São Paulo', 100),
			('São Paulo', 10),
			('Brasília', 60);

SELECT * FROM productStorage;

INSERT INTO storageLocation (idlproduct, idLstorage, location) VALUES
			(1,2,'RJ'),
			(2,6,'GO');


SELECT * FROM storageLocation;

desc supplier;

INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
			('Almeida e filhos', 123456789123456, '21985474'),
			('Eletrônicos Silva', 854519649143457, '21985484'),
			('Eletrônicos Valma', 934567893934695, '21975474');


SELECT * FROM supplier;

INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
			(1,1,500),
			(1,2,400),
			(2,4,633),
			(3,3,5),
			(2,5,10);

SELECT * FROM productSupplier;

desc seller;

INSERT INTO seller(SocialName, AbstName, CNPJ, CPF, location, contact) VALUES
			('Tech Eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
			('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
			('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);


desc productSeller;

INSERT INTO productSeller(idPseller, idPproduct, prodQuantity) VALUES
			(1,6,80),
			(2,7,10);

SELECT * FROM productSeller;

desc TipoCliente;

INSERT INTO TipoCliente (Descrição) VALUES
			('PJ'),
			('PF');

SELECT * from TipoCliente;			


desc Pagamento;

INSERT INTO Pagamento(Descrição) VALUES
			('Boleto'),
			('Cartão de Crédito'),
			('Pix'),
			('Débito em Conta');

SELECT * FROM Pagamento;

SELECT * FROM clients;

UPDATE clients SET idTipoCliente = 2 WHERE idClient = 1;
UPDATE clients SET idTipoCliente = 1 WHERE idClient = 2;
UPDATE clients SET idTipoCliente = 1 WHERE idClient = 3;


desc FormaPagamento;

INSERT INTO FormaPagamento (Nome)


desc clients;
desc orders;

-- Número de clientes que tenho
SELECT count(*) FROM clients;


-- Verificando o número de pedidos realizados
SELECT * FROM clients c, orders o WHERE c.idClient = idOrderClient;


-- Especificando o número de pedidos realizados e seus atributos
SELECT concat(Fname, ' ', Lname) as Client,
	idOrder as Request,
	orderStatus as Status
FROM clients c,
	orders o
WHERE c.idClient = idOrderClient;



INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
			(2, default, 'compra via aplicativo', null, 1);


SELECT count(*)
FROM clients c,
	orders o
WHERE c.idClient = idOrderClient
GROUP BY idOrder;

-- Recupera também os clientes que não fizeram pedido
SELECT * FROM clients c
INNER JOIN orders o ON c.idClient = o.idOrderClient;


--Recuperar de pedidos com produto associado
SELECT c.idClient,
	Fname,
	count(*) as Number_of_Orders
FROM clients c
	INNER JOIN orders o ON c.idClient = o.idOrderClient
	INNER JOIN productOrder p ON p.idPOorder = o.idOrder
GROUP BY c.idClient;




