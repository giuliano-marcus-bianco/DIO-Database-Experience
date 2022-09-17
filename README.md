

---

# DIO-Database-Experience
Repositório feito para documentar o bootcamp sobre Banco de Dados da DIO para profissionais de Ciência de Dados, com os conceitos de banco de dados SQL e NoSQL.

------

[TOC]



## **Desafios**  :zap:

### **[Refinando um Projeto Conceitual de Banco de Dados - E-COMMERCE](doc/Desafio1)** :checkered_flag: 

A entrega deste desafio foi feita a partir de práticas de Modelagem EER utilizando o MySQL Workbench. Inicialmente, foi modelado dois projetos mais simples, o primeiro de um Sistema de Ordem de Serviço, o segundo de uma Universidade, ambos [documentados na pasta do de aprendizado](doc/Aprendizado). Por fim, foi feito o Modelo EER de um E-commerce, utilizando o escopo narrativo dado durante as aulas, além dos seguintes critérios:

- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
- Entrega – Possui status e código de rastreio.

Tanto os arquivos de edição da modelagem, quanto as imagem apresentada a seguir, também estão na [pasta de documentação do desafio](doc/Desafio1).

![e-commerce](doc/Desafio1/static/img/e-commerce.png)

### **[Construindo um Esquema Conceitual para Banco De dados](doc/Desafio2)** :checkered_flag: 

A entrega deste desafio foi feita a partir de práticas de Modelagem EER utilizando o MySQL Workbench. Para este desafio, foi modelado do zero um banco de dados relacional de um Sistema de Ordem de Serviço para uma Oficina Mecânica. O escopo narrativo utilizado foi dados a partir dos seguintes critérios:

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica
- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra
- O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços
- A mesma equipe avalia e executa os serviços
- Os mecânicos possuem código, nome, endereço e especialidade
- Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

Tanto os arquivos de edição da modelagem, quanto as imagem apresentada a seguir, também estão na [pasta de documentação do desafio](doc/Desafio2).

![oficina](doc/Desafio2/static/img/oficina.png)

## **Entre em contato**	:speech_balloon:

[giuliano.bianco@fatec.sp.gov.br](Email)	:envelope:

[www.linkedin.com/in/giuliano-marcus-bianco/](LinkedIn)	:man_office_worker:
