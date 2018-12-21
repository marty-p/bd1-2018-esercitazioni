create schema palestra;

create table palestra.corso(
	codicec serial primary key,
	nomecorso varchar(126) not null,
	nomeistruttore varchar(126) not null,
	capienza int check (capienza between 15 and 30)
);

create table palestra.atleta(
	codicea serial primary key,
	nomeatleta varchar(126) not null,
	cognomeatleta varchar(126) not null,
	eta int,
	categoria varchar(126) not null check (categoria in ('principiante', 'intermedio', 'esperto'))
);

create table palestra.iscrizione(
	corso serial references palestra.corso,
	atleta serial references palestra.atleta,
	abbonamento varchar(126) check ( abbonamento in ('open', 'singolo')),
	primary key (corso, atleta)
);

