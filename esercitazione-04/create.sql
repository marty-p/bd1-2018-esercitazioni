create schema progetti;

create table progetti.progetto(
	codP char(3) primary key,
	nome varchar(50),
	anno /*small*/int,
	budget int check (budget > 10000) not null
);

create table progetti.dipendente(
	codD char(3) primary key,
	cognome varchar(50) not null,
	nome varchar(50) not null,
	citta varchar(50)
);

create table progetti.partecipa(
	progetto char(3) references progetti.progetto
		on update no action
		on delete cascade,
	dipendente char(3) references progetti.dipendente
		on update no action
		on delete cascade,
	mesi /*small*/int check (mesi between 3 and 24),
	ruolo varchar(50),
	primary key(progetto, dipendente)
);
