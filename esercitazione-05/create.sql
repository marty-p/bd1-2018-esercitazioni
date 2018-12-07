create schema prestiti;

create table prestiti.cliente (
	idcliente char(3) primary key,
	cognome varchar(50) not null,
	nome varchar(50) not null,
	citta_residenza varchar(50),
	unique(cognome, nome)
);

create table prestiti.filiale (
	idfiliale char(3) primary key,
	importo_max decimal(7, 2) not null,
	citta varchar(50)
);

create table prestiti.prestito (
	idprestito char(3) primary key not null,
	filiale char(3) references prestiti.filiale not null,
	importo decimal(7, 2) not null,
	data_accensione date not null check (data_accensione < data_scadenza),
	data_scadenza date not null

);

create table accordato (
	prestito char(3) references prestiti.prestito,
	cliente char(3) references prestiti.cliente
);

