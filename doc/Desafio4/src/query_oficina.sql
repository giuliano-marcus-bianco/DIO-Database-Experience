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