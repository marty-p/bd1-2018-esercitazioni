create schema palestra;

-- serial or smallint or int

create table palestra.corso(
	codicec serial primary key,
	nomecorso varchar(128) not null,
	nomeistruttore varchar(128) not null,
	capienza int check (capienza between 15 and 30),
	unique(nomecorso)
);

create table palestra.atleta(
	codicea serial primary key,
	nomeatleta varchar(128) not null,
	cognomeatleta varchar(128) not null,
	eta int,
	categoria varchar(128) not null check (categoria in ('principiante', 'intermedio', 'esperto'))
);

create table palestra.iscrizione(
	corso serial references palestra.corso
		on delete cascade
		on update cascade,
	atleta serial references palestra.atleta
		on delete no action
		on update cascade,
	abbonamento varchar(128) check ( abbonamento in ('open', 'singolo')),
	primary key (corso, atleta)
);

