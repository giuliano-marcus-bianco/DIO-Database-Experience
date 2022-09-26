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