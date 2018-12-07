create schema prestiti;

create table prestiti.cliente (
	idcliente char(3) primary key,
	cognome varchar(128) not null,
	nome varchar(128) not null,
	citta_residenza varchar(128),
	unique(nome, cognome)
);

create table prestiti.filiale (
	idfiliale char(3) primary key,
	importo_max decimal(12, 2) not null,
	citta varchar(128)
);

create table prestiti.prestito (
	idprestito char(3) primary key,
	filiale char(3) references prestiti.filiale
		on delete no action
		on update cascade,
	importo decimal(12, 2) not null,
	data_accensione date not null check (data_accensione < data_scadenza),
	data_scadenza date not null

);

create table prestiti.accordato_a (
	prestito char(3) references prestiti.prestito
		on delete cascade
		on update cascade,
	cliente char(3) references prestiti.cliente
		on delete cascade
		on update cascade,
	primary key (prestito, cliente)
);

