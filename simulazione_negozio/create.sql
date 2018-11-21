create schema negozio;

/*replace serial with smallint*/

--drop table negozio.vetrina;
create table negozio.vetrina(
codiceV serial primary key,
nomeVetrina varchar(50) unique not null,
nomeReparto varchar(50) check(nomeReparto IN ('uomo','donna','bambino')) not null,
--nomeReparto varchar(50) check(nomeReparto 0 ANY ('{"uomo","donna","bambino"}')) not null,
metratura int check(metratura between 10 and 200)
);

--drop table negozio.prodotto;
create table negozio.prodotto(
codiceP serial primary key,
nomeProdotto varchar(50) not null,
marca varchar(50) not null,
categoria varchar(50) not null,
prezzo float not null check (prezzo > 1)
);

--drop table negozio.presenza;
create table negozio.presenza(
vetrina serial references negozio.vetrina
	on delete cascade
	on update cascade,
prodotto serial references negozio.prodotto
	on delete no action
	on update cascade,
quantita int check (quantita > 0),
primary key(vetrina, prodotto)
);

