create schema immobili;

create table immobili.immobile(
	codi char(3) primary key,
	indirizzo varchar(64) not null,
	tipo varchar(64) not null check (tipo in ('appartamento', 'villetta', 'magazzino')),
	zona varchar(64) not null check (zona in ('residenziale', 'centro', 'periferia')),
	prezzo_richiesto decimal(15, 2) not null
);

create table immobili.agente(
	coda char(3) primary key,
	cognome varchar(64),
	nome varchar(64),
	agenzia varchar(64) not null
);

create table immobili.visita(
	codi char(3) references immobili.immobile
		on delete cascade
		on update cascade,
	coda char(3) references immobili.agente
		on delete no action
		on update cascade,
	data date,
	primary key(codi, coda, data)
);

create table immobili.vendita(
	codi char(3) references immobili.immobile
		on delete no action
		on update cascade,
	coda char(3) not null references immobili.agente
		on delete no action
		on update cascade,
	data date,
	prezzo decimal(9, 2) not null,
	primary key(codi)
);
