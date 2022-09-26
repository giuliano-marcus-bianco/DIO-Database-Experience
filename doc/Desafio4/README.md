# Desafio 4

## **Construa um Projeto Lógico de Banco de Dados do Zero**



### [**Criação do database, tabelas, atributos e relacionamento:**](src/oficina.sql)

```
show databases;
create database oficina;
use oficina;

show tables;

-- criar tabela cliente

create table clients(
	idClient int auto_increment primary key,
    clientName varchar(45) not null,
    clientAddress varchar(255) not null,
    clientContact varchar(13) not null
);


-- criar tabela mecânico

create table mecanic(
	idMecanic int auto_increment primary key,
    mecanicName varchar(45) not null,
    mecanicAddress varchar(255) not null,
    mecanicSpecialty varchar(45) not null
);


-- criar tabela veículo

create table vehicle(
	idVehicle int auto_increment primary key,
    vehicleIdClient int,
	model varchar(20) not null,
    brand varchar(10) not null,
    fabricationYear char(4),
    color varchar(14),
    repair_review enum('Conserto', 'Revisão') default 'Revisão',
    constraint fk_vehicle_idClient foreign key (vehicleIdClient) references clients(idClient)
);


-- criar a tabela equipe de mecânicos

create table mecanicTeam(
	teamIdVehicle int,
    teamIdMecanic int,
    primary key (teamIdVehicle, teamIdMecanic),
    constraint fk_mecanicTeam_idVehicle foreign key (teamIdVehicle) references vehicle(idVehicle),
    constraint fk_mecanicTeam_idMecanic foreign key (teamIdMecanic) references mecanic(idMecanic)
);


-- criar tabela os

create  table os(
	idOS int auto_increment primary key,
    osEmissionDate date not null,
    osCost float not null,
    osStatus enum('Pendente', 'Aprovado', 'Concluído', 'Rejeitado') default 'Pendente',
    osConclusionDate date not null
);


-- criar tabela peças

create table parts(
	idParts int auto_increment primary key,
    partName varchar(45) not null,
    partModel varchar(45) not null,
    partBrand varchar (15) not null,
    partCost float not null
);


-- criar tabela mão de obra

create table service(
	idService int auto_increment primary key,
    serviceName varchar(45) not null,
    serviceSpecialty varchar(45),
    serviceCost float not null
);


-- criar tabela identifica o serviço

create table identifyService(
	identifyIdVehicle int,
    identifyIdMecanicTeam int,
    identifyIdOs int,
    primary key (identifyIdVehicle, identifyIdMecanicTeam, identifyIdOs),
    constraint fk_identifyService_idVehicle_MecanicTeam foreign key (identifyIdVehicle) references mecanicTeam(teamIdVehicle),
    constraint fk_identifyService_idMecanic_MecanicTeam foreign key (identifyIdMecanicTeam) references mecanicTeam(teamIdMecanic),
    constraint fk_identifyService_idOS_os foreign key (identifyIdOs) references os(idOS)
);


-- criar tabela executa o serviço

create table executeService(
	executeIdVehicle int,
    executeIdMecanic int,
    executeIdOs int,
    primary key (executeIdVehicle, executeIdMecanic, executeIdOs),
    constraint fk_executeService_idVehicle_MecanicTeam foreign key (executeIdVehicle) references mecanicTeam(teamIdVehicle),
    constraint fk_executeService_idMecanic_identifyService foreign key (executeIdMecanic) references identifyService(identifyIdMecanicTeam),
    constraint fk_executeService_idOS_identifyService foreign key (executeIdOs) references identifyService(identifyIdOs)
);


-- criar tabela os tem mão de obra

create table osService(
	os_idOS int,
    service_idService int,
    primary key (os_idOS, service_idService),
    constraint osService_idOs_os foreign key (os_idOS) references os(idOS),
    constraint osService_idService_service foreign key (service_idService) references service(idService)
);


-- criar tabela os tem peça

create table osParts(
	os_idOS int,
    parts_idParts int,
    primary key (os_idOS, parts_idParts),
    constraint osParts_idOs_os foreign key (os_idOS) references os(idOS),
    constraint osParts_idParts_parts foreign key (parts_idParts) references parts(idParts)
);


show tables;
```



### [**Persistência dos dados:**](src/persist_oficina.sql)



```
-- persistir dados na tabela clientas

insert into clients(clientName, clientAddress, clientContact) values
	('Marco Aurélio', 'Praça Carlos Gomes, 76, São José dos Campos (SP', 5512991620725),
    ('Fernando Santeos', 'Rua Shizuko IIda, 150, São José dos Campos (SP', 5512991682120),
    ('Patricia Santos', 'Rua Shizuko IIda, 150, São José dos Campos (SP', 5512991682120),
    ('Juan Senefonte', 'Rua Piracicaba, 15, São José dos Campos (SP', 5512988102121);
    
select * from clients;


-- persistir dados na tabela macânicos

insert into mecanic (mecanicName, mecanicAddress, mecanicSpecialty) values
	('Joel Batista', 'Rua dos Orixás, 10, Taubaté (SP)', 'Auto elétrica'),
    ('Manoel Lourença', 'Rua dos Calafetes, 120, Taubaté (SP)', 'Mecânica Geral'),
    ('Sérgio Gusmão', 'Rua Alfredo Borges, Jacareí (SP)', 'Mecânica Geral');
    
select * from mecanic;


-- persistir dados na tabela veículos

insert into vehicle (vehicleIdClient, model, brand, fabricationYear, color, repair_review) values
	(1, 'Creta', 'Hyundai', 2019, 'branco', default),
    (2, 'HB20', 'Hyundai', 2015, 'branco', default),
    (3, 'Picasso', 'Citroen', 2010, 'preto', 'Conserto'),
    (1, 'HB20', 'Hyundai', 2015, 'branco', default);
    
select * from vehicle;


-- persistir dados na tabela peças

insert into parts (partName, partModel, partBrand, partCost) values
	('escapamento', '20 litros Citroen', 'Citroen', 2000),
    ('para-brisa', 'vidro dianteiro', 'Citroen', 1800),
    ('bom-ar', 'condensador de odor - solução flores do campo', 'Citroen', 45.99),
    ('bateria', '12V', 'Moura', 649.99)
    ;
    
select * from parts;


-- persistir dados na tabela mão de obra

insert into service (serviceName, serviceSpecialty, serviceCost) values
	('troca de bateria', 'Auto elétrica', 79.99),
    ('troca de escapamento', 'Mecânica Geral', 209.99),
    ('troca de para-brisa', 'Vidraçaria', 309.99);
    
select * from service;
```



### [Queries de recuperação:](src/query_oficina.sql)



```
-- retornar todos os atributos dos veículos

select *
from vehicle;


-- retornar modelo e ano de fabricação dos veículos fabricados após 2012

select model, fabricationYear
from vehicle
where fabricationYear > 2012;


-- retornar quantos carros possuem a cor branca

select count(*)
from vehicle
where color = 'branco';


-- retornar todos os atributos dos clientes em ordem alfabética dos nomes

select *
from clients
order by clientName;


-- retornar a contagem de mecânicos agrupados por especialidade, no qual a especialidade seja mecânica geral

select count(*)
from mecanic
group by mecanicSpecialty
having mecanicSpecialty = 'Mecânica geral';


-- retona o inner join entre as tabelas de clientes e de veículos, usando como parâmetro de busca o id dos clientes

select *
from clients
inner join vehicle
on idClient = vehicleIdClient;
```

