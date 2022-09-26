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