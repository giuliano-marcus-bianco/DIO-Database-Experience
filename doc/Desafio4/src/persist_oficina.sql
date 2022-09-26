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