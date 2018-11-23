create schema public;

create table public.progetto(
	codp char(3) primary key,
	nome varchar(50),
	anno int,
	budget int check (budget > 10000) not null
);

create table public.dipendente(
	codp char(3) primary key,
	cognome varchar(50) not null,
	nome varchar(50) not null,
	citta varchar(50)
);

create table public.partecipa(
	progetto char(3) references public.progetto,
	dipendente char(3) references public.dipendente,
	mesi int check (mesi between 3 and 24),
	ruolo varchar(50)
);

