
create database if not exists travel_express;

create table if not exists travel_express.user(
	id int primary key not null auto_increment,
    username VARCHAR(20),
    password VARCHAR(30),
    name varchar(20),
    firstname varchar(20),
    email varchar(100),
    phone varchar(12),
    rating decimal(3,2)
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


/*-------------POPULATE USER TABLE-----------------*/
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`) VALUES ('1', 'admin', 'admin', 'admin', 'jacob', 'admin@travelexpress.com');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('2', 'molee', '123aze', 'Lee', 'Monique', 'monique@gmail.com', '613-555-0152', '4.7');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `rating`) VALUES ('3', 'lauwi', '456qsd', 'Wilson', 'Laurie', 'laurie@gmail.com', '4.2');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`) VALUES ('4', 'shamo', '789wxc', 'Morris', 'Shana', 'shana@gmail.com', '250-555-0123');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('5', 'perjo', '147wqa', 'Johnson', 'Perle', 'perle@gmail.com', '418-555-0171', '3.9');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('6', 'johal', '258xsz', 'Hall', 'Joeanne', 'joeanne@gmail.com', '613-555-0142', '4.5');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('7', 'laumu', '369cde', 'Murphy', 'Laurine', 'laurine@gmail.com', '867-555-0141', '2.5');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`) VALUES ('8', 'dema', 'rtfgvb', 'Martin', 'Deborah', 'deborah@gmail.com');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('9', 'clahill', 'nhytgf', 'Hill', 'Clarisse', 'clarisse@gmail.com', '902-555-0138', '4.8');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `rating`) VALUES ('10', 'aubro', 'jo14gf', 'Brown', 'Aurora', 'aurora@gmail.com', '3.7');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('11', 'alja', 'er45hnj', 'Jackson', 'Alexia', 'alexia@gmail.com', '250-555-0182', '4.6');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`) VALUES ('12', 'thiersmi', '6gfd24y', 'Smith', 'Thierry', 'thierry@gmail.com');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('13', 'bruro', '47trdf2', 'Robert', 'Bruno', 'bruno@gmail.com', '418-555-0140', '5');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`) VALUES ('14', 'algree', 'fezf5', 'Greenwood', 'Alain', 'alain@gmail.com');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `rating`) VALUES ('15', 'scolaw', '8thds', 'Lawrence', 'Scott', 'scott@gmail.com', '4.1');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('16', 'matho', '3rtgsf', 'Thompson', 'Mathieu', 'mathieu@gmail.com', '418-555-0112', '3.8');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`) VALUES ('17', 'flash', '73zqef1', 'Ashton', 'Florent', 'florent@gmail.com');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`, `rating`) VALUES ('18', 'douwe', '65frefg', 'Weber', 'Douglas', 'douglas@gmail.com', '867-555-0145', '4.3');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `phone`) VALUES ('19', 'frawall', 'bjo47', 'Wallace', 'François', 'françois@gmail.com', '807-555-0151');
INSERT INTO `travel_express`.`user` (`id`, `username`, `password`, `name`, `firstname`, `email`, `rating`) VALUES ('20', 'jemack', 'poljh3', 'Mackenzie', 'Jeffrey', 'jeffrey@gmail.com', '4.2');

/*-------------POPULATE TRAVEL TABLE-----------------*/
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('1', '2', '2018-10-05', 'Québec', 'Montréal', '5,00', '2', '0', '1', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('2', '3', '2018-10-06', 'Chicoutimi', 'Québec', '5,00', '3', '0', '0', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('3', '5', '2018-10-06', 'Trois-Rivières', 'Cap Chat', '5,00', '4', '0', '1', '0', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('4', '6', '2018-10-10', 'Sept-Îles', 'Chibougamau', '5,00', '3', '0', '1', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('5', '7', '2018-10-11', 'Val-d\'or', 'Trois-Rivières', '5,00', '5', '0', '1', '0', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('6', '9', '2018-10-12', 'Maniwaki', 'Gaspé', '5,00', '2', '1', '1', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('7', '10', '2018-10-15', 'Salluit', 'Kuujjuarapik', '5,00', '6', '0', '0', '0', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('8', '11', '2018-10-17', 'Cap Chat', 'Sherbrooke', '5,00', '3', '0', '1', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('9', '13', '2018-10-20', 'Chibougamau', 'Québec', '5,00', '4', '0', '1', '0', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('10', '15', '2018-10-21', 'Inukjuak', 'Sept-Îles', '5,00', '1', '1', '0', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('11', '16', '2018-10-22', 'Baie Comeau', 'Blanc-Sablon', '5,00', '2', '0', '1', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('12', '18', '2018-10-22', 'Sherbrooke', 'Gaspé', '5,00', '4', '0', '1', '1', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('13', '20', '2018-10-25', 'Montréal', 'Chicoutimi', '5,00', '3', '0', '0', '0', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('14', '2', '2018-10-30', 'Umiujaq', 'Baie Comeau', '5,00', '4', '0', '1', '0', '2');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('15', '3', '2018-11-15', 'Cap Chat', 'Chibougamau', '5,00', '5', '0', '0', '0', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('16', '5', '2018-11-15', 'Chicoutimi', 'Blanc-Sablon', '5,00', '2', '1', '1', '1', '1');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('17', '6', '2018-11-15', 'Chibougamau', 'Salluit', '5,00', '6', '0', '1', '0', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('18', '7', '2018-11-17', 'Val-d\'or', 'Rivière-du-Loup', '5,00', '8', '0', '1', '0', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('19', '9', '2018-11-19', 'Rivière-du-Loup', 'Montréal', '5,00', '4', '0', '1', '1', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('20', '10', '2018-11-19', 'Montréal', 'Québec', '5,00', '3', '0', '0', '1', '1');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('21', '11', '2018-11-21', 'Gaspé', 'Cap Chat', '5,00', '2', '1', '1', '1', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('22', '13', '2018-11-22', 'Kuujjuaq', 'Salluit', '5,00', '3', '0', '1', '1', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('23', '7', '2018-11-23', 'Sept-Îles', 'Chibougamau', '5,00', '3', '0', '1', '1', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('24', '15', '2018-11-23', 'Val-d\'or', 'Chicoutimi', '5,00', '4', '0', '0', '1', '1');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('25', '18', '2018-11-24', 'Maniwaki', 'Sherbrooke', '5,00', '3', '0', '1', '1', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('26', '20', '2018-11-26', 'Kuujjuarapik', 'Inukjuak', '5,00', '4', '0', '0', '0', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('27', '3', '2018-11-27', 'Chicoutimi', 'Baie Comeau', '5,00', '5', '0', '0', '1', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('28', '7', '2018-11-29', 'Cap Chat', 'Rivière-du-Loup', '5,00', '2', '1', '1', '1', '1');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('29', '20', '2018-11-29', 'Québec', 'Sherbrooke', '5,00', '3', '0', '0', '1', '0');
INSERT INTO `travel_express`.`travel` (`id`, `id_offerer`, `date`, `from_adress`, `to_adress`, `cost`, `seats_number`, `smoke`, `phone`, `luggage`, `state`) VALUES ('30', '15', '2018-11-30', 'Umiujaq', 'Kuujjuaq', '5,00', '4', '0', '0', '1', '0');

/*-------------POPULATE TRANSACTION TABLE-----------------*/
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('1', '5,00', '6', '5');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('2', '5,00', '12', '5');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('3', '5,00', '13', '10');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('4', '5,00', '5', '10');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('5', '5,00', '7', '10');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('6', '5,00', '9', '15');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('7', '5,00', '8', '15');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('8', '5,00', '16', '15');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('9', '5,00', '16', '15');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('10', '5,00', '2', '7');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('11', '5,00', '10', '7');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('12', '5,00', '12', '6');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('13', '5,00', '18', '20');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('14', '5,00', '19', '9');
INSERT INTO `travel_express`.`transaction` (`id`, `amont`, `id_payer`, `id_receiver`) VALUES ('15', '5,00', '11', '3');

/*-------------POPULATE RESERVATION TABLE-----------------*/
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('1', '16', '6', '1', '1');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('2', '16', '12', '1', '2');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('3', '20', '13', '1', '3');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('4', '20', '5', '1', '4');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('5', '20', '7', '1', '5');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('6', '24', '9', '1', '6');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('7', '24', '8', '1', '7');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('8', '24', '16', '1', '8');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('9', '24', '16', '1', '9');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('10', '28', '2', '1', '10');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('11', '28', '10', '1', '11');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('12', '17', '12', '1', '12');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('13', '26', '18', '1', '13');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('14', '19', '19', '1', '14');
INSERT INTO `travel_express`.`reservation` (`id`, `id_travel`, `id_reserver`, `confirmed`, `id_transaction`) VALUES ('15', '15', '11', '1', '15');
