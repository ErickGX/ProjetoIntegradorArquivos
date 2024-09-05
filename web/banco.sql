create database IF NOT EXISTS banco;

use banco;

create table produtos(
    id int not null primary key,
    nome varchar(50),
    marca varchar(50),
    preco double
);

insert into produtos values("1","Tv", "Toshiba", 2000.00);
insert into produtos values("2","geladeira", "Brastemp", 4000.00);


