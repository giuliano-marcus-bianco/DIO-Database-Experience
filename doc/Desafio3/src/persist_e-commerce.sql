-- persisitindo na tabela clients

insert into clients (personCompany) 
	values(default),
	(default),
    ('Pessoa Jurídica'),
    (default),                                    
    ('Pessoa Jurídica'),
	(default),
    (default),
    (default);
    
select * from clients;


-- persistindo na tabela person

insert into person () values 
	(01234567891, 1, 'Maria', 'Sousa', 19911017, 'Rua dos campos altos, 123, Cidade Baixa (RJ)'),
    (01234567892, 2, 'José', 'Santos', '19870207', 'Rua dos mouros, 123, Bahia (BA)'),
    (01234567893, 4, 'Rui', 'Lamarca', '19640127', 'Rua Antonio Salles, 67, São Paulo (SP)'),
    (01234567894, 6, 'Pâmela', 'Costa', '19910912', 'Rua Amado Batista, 156, Sucupera (SP)'),
    (01234567895, 7, 'Patrícia', 'Santos', '19620301', 'Rua da Empatia, 72, Solto (RJ)'),
    (01234567896, 8, 'Márcio', 'Sousa', '19840619', 'Rua Desembargador Vitor Lima, 17, Florianópolis (SC)');
    
    select * from person;
    
insert into company () values
	(01234567891011, 3, 'Importadora São Mateus Ltda.', null, 'Rua Sobradinho Amaral, 27, Sacupemba (SP)'),
    (01234567891012, 5, 'Trust and Value S/A', 'Vale Verde', 'Rua Onofre de Araújo, 598, Rio de Janeiro (RJ)');


-- persistindo na tabela company
    
select * from company;


-- persistindo na tabela product

insert into product (productName, productCost, productRating, productBrand, productModel, productDescription) values
	('Garrafa térmica', 49.90, 7.9, null, null, 'Garrafa térmica para líquidos quentes e gelados'),
    ('Mochila para notebook', 540.99, null, 'Dell', 'DL-409', 'Mochila para notebook de até 19 polegadas, com fundo acolchoado e 9 bolsos ao todo'),
    ('Televisão LG 49 polegadas OLED', 1237.98, 8.9, 'LG', 'LG-4903-O', 'Mochila para notebook de até 19 polegadas, com fundo acolchoado e 9 bolsos ao todo'),
    ('Iphone 12 Pro', 3239.99, 9.4, 'Apple', 'Iphone 12 Pro', null);
    
select * from product;


-- persistindo na tabela card

insert into card (cardHolder, cardNumber, cardDue, cardPaymentType) values
	('Maria Sousa', 1234567890101112, 20300901, default),
    ('Rui M Lamarca', 1234567890101113, 20240201, 'Débito');

select * from card;


-- persistindo na tabela deposit

insert into deposit (barCode, emissionDate, dueDate) values
	('0923849823', 20220925, 20221005),
    ('02938490289043', 20220829, 20220909);
    
select * from deposit;


-- persistindo tabela pix

insert into pix (accountHolder, pixKey, bankCode, accountNumber, cpfHolde) values
	('Pamêla Maria Costa', '0-aidfsaidoas-0asodsa0o', 09201, 09812038102, 1234567894),
    ('Márcio Sousa Jr', '98adju9asjud98ajsd', 0958039485, 09584983, 1234567896);
    
select * from pix;


-- persistindo tabela payment

insert into payment (paymentIdClient, paymentIdCard, paymentIdDeposit, paymentIdPix, paymentType) values
	(1, 1, null, null, default),
    (4, 2, null, null, 'Débito'),
    (5, null, 1, null, 'Boleto'),
    (5, null, 2, null, 'Boleto'),
    (6, null, null, 1, 'PIX'),
    (8, null, null, 2, 'PIX');
    
select * from payment;


-- persistindo tabela orders

insert into orders (orderIdClient, orderIdPayment, orderDate, orderStatus, shipmentCost, observation, orderIdProduct) values
	(1, 1, 20220926, 'Processando', 5.5, null, 1),
	(4, 2, 20220805, default, 15.98, null, 1),
	(5, 3, 20220709, 'Aprovada', 89.99, null, 3),
	(5, 4, 20220929, default, 89.99, 'Emitir boleto no CNPJ da empresa', 3),
	(6, 5, 20220710, 'Aprovada', 15.25, null, 4),
	(8, 6, 20220710, 'Cancelada', 0, null, 2);
    
select * from orders;


-- persistindo tabela shipment

insert into shipment (shipmentIdOrder, trackCode, shipmentStatus, shipmentDate, estimateArrival) values
	(15, 'br20190812901zl', default, null, null),
    (17, 'br0992808ml', 'Enviado', 20220925, 20221025),
    (18, 'br09128821ch', 'Cancelado', null, null);
    
select * from shipment;