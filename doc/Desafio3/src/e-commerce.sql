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