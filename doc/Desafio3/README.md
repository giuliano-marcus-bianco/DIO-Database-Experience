# Desafio 3

## Construindo seu Primeiro Projeto Lógico de Banco de Dados



### [**Criação do database, tabelas, atributos e relacionamento:**](src/e-commerce.sql)

```
-- criação do banco de dados  para o cenário de E-commerce
show databases;
create database if not exists ecommerce;
use ecommerce;

show tables;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    personCompany enum('Pessoa física', 'Pessoa jurídica') default 'Pessoa física'
);


-- criar tablea pessoa física

create table person(
	CPF char(11) primary key,
    personIdClient int,
    Fname varchar(25) not null,
    Lname varchar(25) not null,
    Bdate date not null,
    Address varchar(100) not null,
    constraint unique_cpf_person unique (CPF),
    constraint fk_person_client foreign key (personIdClient) references clients(idClient)
);


-- criar tabela pessoa jurídica

create table company(
	CNPJ char(14) primary key,
    companyIdClient int,
    Company_name varchar(45) not null,
    Fantasy_name varchar(45),
    Address varchar(100) not null,
    constraint unique_CompanyName_company unique(Company_name),
    constraint fk_company_client foreign key (companyIdClient) references clients(idClient)
);


-- criar tabela produto

create table product(
	idProduct int auto_increment primary key,
    productName varchar(45) not null,
    productCost float not null,
    productRating float,
    productBrand varchar(45),
    productModel varchar(45),
    productDescription varchar(200)
);



-- criar tabela cartão

create table card(
	idCard int auto_increment primary key,
    cardHolder varchar(45) not null,
    cardNumber varchar(16) not null,
    cardDue date not null,
    cardPaymentType enum('Crédito', 'Débito') default 'Crédito',
    constraint unique_cardNumber unique(cardNumber)
);


-- criar tabela boleto

create table deposit(
	idDeposit int auto_increment primary key,
    barCode varchar(45) not null,
    emissionDate date not null,
    dueDate date not null
);


-- criar tabela pix

create table pix(
	idPix int auto_increment primary key,
    accountHolder varchar(45) not null,
    pixKey varchar(45) not null,
    bankCode varchar(45) not null,
    accountNumber varchar(45) not null,
    cpfHolde char(11),
    constraint unique_pixKey unique(pixKey)
);


-- criar tabela pagamento

create table payment(
	idPayment int auto_increment primary key,
    paymentIdClient int,
    paymentIdCard int,
    paymentIdDeposit int,
    paymentIdPix int,
    paymentType enum('Crédito', 'Débito', 'Boleto', 'PIX') default 'Crédito',
    constraint fk_payment_client foreign key (paymentIdClient) references clients(idClient),
    constraint fk_payment_card foreign key (paymentIdCard) references card(idCard),
    constraint fk_payment_deposit foreign key (paymentIdDeposit) references deposit(idDeposit),
    constraint fk_payment_pix foreign key (paymentIdPix) references pix(idPix)
);


-- criar tabela pedido

create table orders(
	idOrder int auto_increment primary key,
    orderIdClient int,
    orderIdPayment int,
    orderIdProduct int,
    orderDate date not null,
    orderStatus enum('Aguardando pagamento', 'Processando', 'Aprovada', 'Cancelada') default 'Aguardando pagamento',
    shipmentCost float not null,
    observation varchar(255),
    constraint fk_orders_client foreign key (orderIdClient) references clients(idClient),
    constraint fk_orders_payment foreign key (orderIdPayment) references payment(idPayment),
    constraint fk_orders_product foreign key (orderIdProduct) references product(idProduct)
);


-- criar tabela entrega

create table shipment(
	idShipment int auto_increment primary key,
    shipmentIdOrder int,
    trackCode varchar(45) not null,
    shipmentStatus enum('Processando', 'Enviado', 'Entregue', 'Cancelado') default 'Processando',
    shipmentDate date,
    estimateArrival date,
    constraint fk_shipment_orders foreign key (shipmentIdOrder) references orders(idOrder)
);


-- criar tabela pedido-tem-produto

create table ProductOrder(
	POrderIdOrder int,
    POrderIdProduct int,
    POrderQuantity int not null,
    primary key (POrderIdOrder, POrderIdProduct),
    constraint fk_ProductOrder_orders foreign key (POrderIdOrder) references orders(idOrder),
    constraint fk_ProductOrder_product foreign key (POrderIdProduct) references product(idProduct)
);


-- criar tabela estoque

create table storages(
	idStorage int auto_increment primary key,
    storageCompanyName varchar(45) not null,
    storageCompanyCNPJ char(14) not null,
    storageAddress varchar(255),
    storageContact char(13) not null,
    constraint unique_storageCompanyName unique(storageCompanyName),
    constraint unique_storageCompanyCNPJ unique(storageCompanyCNPJ)
);


-- criar tabela fornecedor

create table supplier(
	idSupplier int auto_increment primary key,
    supplierCompanyName varchar(45) not null,
    supplierCompanyCNPJ char(14) not null,
    supplierAddress varchar(255),
    supplierContact char(13) not null,
    constraint unique_suplierCompanyName unique(supplierCompanyName),
    constraint unique_supplierCompanyCNPJ unique(supplierCompanyCNPJ)
);


-- criar tabela vendedor

create table seller(
	idSeller int auto_increment primary key,
    sellerCompanyName varchar(45) not null,
    sellerCompanyCNPJ char(14) not null,
    sellerRating float not null,
    sellerAddress varchar(255),
    sellerContact char(13) not null,
    constraint unique_sellerCompanyName unique(sellerCompanyName),
    constraint unique_sellerCompanyCNPJ unique(sellerCompanyCNPJ)
);


-- criar tabela estoque-tem-produto

create table ProductStorage(
	PStorageIdStorage int,
    PStorageIdProduct int,
    PStorageQuantity int not null,
    primary key (PStorageIdStorage, PStorageIdProduct),
    constraint fk_ProductStorage_storages foreign key (PStorageIdStorage) references storages(idStorage),
    constraint fk_ProductStorage_product foreign key (PStorageIdProduct) references product(idProduct)
);


-- criar a tabela fornecedor-tem-produto

create table ProductSupplier(
	PSupplierIdSupplier int,
    PSupplierIdProduct int,
    PSupplierQuantity int not null,
    primary key (PSupplierIdSupplier, PSupplierIdProduct),
    constraint fk_ProductSupplier_supplier foreign key (PSupplierIdSupplier) references supplier(idSupplier),
    constraint fk_ProductSupplier_product foreign key (PSupplierIdProduct) references product(idProduct)
);


-- criar a tabela vendedor-tem-produto

create table ProductSeller(
	PSellerIdSeller int,
    PSellerIdProduct int,
    PSellerQuantity int not null,
    primary key (PSellerIdSeller, PSellerIdProduct),
    constraint fk_ProductSeller_seller foreign key (PSellerIdSeller) references seller(idSeller),
    constraint fk_ProductSeller_product foreign key (PSellerIdProduct) references product(idProduct)
);


show databases;
use information_schema;
show tables;
desc referential_constraints;

select *
from referential_constraints
where constraint_schema = 'ecommerce';
```



### [**Persistência dos dados:**](src/persist_e-commerce.sql)



```
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
```



### [Queries de recuperação:](src/query_e-commerce.sql)



```
-- recuperando todos os clientes

select * from clients;


-- recuperando clientes de pessoas física

select *
from clients
where personCompany = 'Pessoa física';


--  recuperando id dos clientes com seus primeiro nome

select idClient Cliente, FName Nome
from clients, person
where idClient=personIdClient;


-- recuperando produtos organizado por preço em ordem decrescente

select *
from product
order by productCost desc;


-- recuperando as tabelas orders e product, agrupado pelo nome do produto, com a condição de que o preço do produto seja superior a 1000

select *
from orders, product
group by productName
having productCost > 1000;


-- recuperando a tabela product juntamente com a tabela orders com left outer join no productName

select *
from product
left outer join orders
on productName;
```

