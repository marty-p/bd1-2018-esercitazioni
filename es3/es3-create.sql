create schema prodotti;

CREATE TABLE prodotti.magazzino
(
	codM char(3) primary key,
	indirizzo varchar(50) not null,
	citta varchar(50) not null
);

CREATE TABLE prodotti.prodotto
(
	codP char(3) primary key,
	nome varchar(50) not null,
	categoria varchar(50) not null
);

CREATE TABLE prodotti.inventario
(
	magazzino char(3) references prodotti.magazzino
		on delete cascade on update cascade,
	prodotto char(3) references prodotti.prodotto
		on delete cascade on update cascade,
	quantita integer /*smallint*/ not null CHECK (quantita > 0),
	prezzo float /*decimal(7,2)*/ not null CHECK (prezzo > 0.00),
	primary key (magazzino, prodotto)
);
