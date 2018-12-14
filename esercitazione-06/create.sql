create schema immobili;

create table immobili.immobile(
	codi char(3) primary key,
	indirizzo varchar(50) not null,
	tipo varchar(50) not null check (tipo in ('appartamento', 'villetta', 'magazzino')),
	zona varchar(50) not null check (zona in ('residenziale', 'centro', 'periferia')),
	prezzo_richiesto decimal(9, 2) not null
);
