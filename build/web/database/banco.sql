    drop database IF EXISTS banco;

    create database IF NOT EXISTS banco;

    use banco;

    create table produtos(
        id int not null,
        nome varchar(50) not null,
        marca varchar(50) not null,
        preco double not null,
        data_fab date not null
    );

    create table users(
        username varchar(100) not null,
        password varchar(20) not null
    );


    insert into users values ("Erick", "teste123@");


    insert into produtos values("1","Tv", "Toshiba", 2000.00, CURRENT_DATE());
    insert into produtos values("2","geladeira", "Brastemp", 4000.00, CURRENT_DATE());

