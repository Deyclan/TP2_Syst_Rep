
create database if not exists travel_express;

create table if not exists travel_express.user(
	id int primary key not null auto_increment,
    username VARCHAR(20),
    password VARCHAR(30),
    name varchar(20),
    firstname varchar(20),
    email varchar(100),
    phone varchar(12),
    rating decimal(2,2)
    );

create table if not exists travel_express.travel(
	id int primary key not null auto_increment,
    id_offerer int not null,
    date date,
    from_adress varchar(200),
    to_adress varchar(200),
    cost decimal(5,2) not null default 0.00,
    seats_number int default 1,
    smoke boolean,
    phone boolean,
    luggage boolean,
    state int,
    foreign key (id_offerer) references travel_express.user(id)
    );


create table if not exists travel_express.transaction(
	id int primary key not null auto_increment,
    amont decimal(5,2),
    id_payer int not null,
    id_receiver int not null
);

create table if not exists travel_express.reservation(
	id int primary key not null auto_increment,
    id_travel int not null,
    id_reserver int not null,
    confirmed boolean default false,
    id_transaction int not null,
    foreign key (id_travel) references travel_express.travel(id),
    foreign key (id_reserver) references travel_express.user(id),
    foreign key (id_transaction) references travel_express.transaction(id)
);
