/*3) Interrogazioni SQL e viste
Scrivere il codice SQL per effettuare le seguenti operazioni:
*/

/*_________________________________
a) Selezionare nome, cognome e categoria degli atleti maggiorenni (età maggiore o uguale a
18) iscritti a corsi tenuti dall’istruttore 'Roberto', ordinati per nome ed eliminando i duplicati.*/

/* WAY 1 */
select distinct nomeatleta, cognomeatleta, categoria
from palestra.atleta
where eta >= 18
and codicea in (
	select atleta
	from palestra.iscrizione
	where corso in (
		select codicec
		from palestra.corso
		where nomeistruttore='Roberto'
	)
)
order by nomeatleta;

/* WAY 2 */
select distinct nomeatleta, cognomeatleta, categoria
from palestra.atleta
join palestra.iscrizione on atleta = codicea
join palestra.corso on corso = codicec
where eta >= 18 and nomeistruttore='Roberto'
order by nomeatleta;


/*_________________________________
b) Selezionare il codice delle coppie di atleti che hanno stesso nome ma che appartengono a
categorie diverse.*/

/* WAY 1 (rimuovendo i doppioni facendo a1 < a2)*/
select a1.codicea, a2.codicea
from palestra.atleta a1
join palestra.atleta a2
	on a1.nomeatleta = a2.nomeatleta
		and a1.codicea <> a2.codicea
		and a1.categoria <> a2.categoria
		and a1.codicea < a2.codicea;

/* WAY 2 (senza join; self-join)*/
select a1.codicea, a2.codicea
from palestra.atleta a1, palestra.atleta a2
where a1.nomeatleta = a2.nomeatleta
	and a1.codicea <> a2.codicea
	and a1.categoria <> a2.categoria
	and a1.codicea < a2.codicea;

/*_________________________________
c) Selezionare, per ogni corso a cui sono iscritti almeno 3 atleti diversi, il nome del corso e
l’eta media degli atleti iscritti a quel corso.*/

/* WAY 1 (only if primary key(corso, atleta))*/
select nomecorso, avg(eta)
from palestra.atleta
join palestra.iscrizione on atleta=codicea
join palestra.corso on corso=codicec
where corso in (
	select corso
	from palestra.iscrizione
	group by corso
	having count(corso) >= 3
)
group by nomecorso;

/* WAY 2 (better) */
select nomecorso, avg(eta)
from palestra.atleta
join palestra.iscrizione on codicea=atleta
join palestra.corso on codicec=corso
group by codicec, nomecorso
having count(distinct atleta) >= 3;

/*_________________________________
d) Selezionare, per ogni corso: il nome del corso, e il nome, il cognome e la categoria
dell’atleta più giovane iscritto a quel corso.*/

/* WAY 1 */
select nomecorso, nomeatleta, cognomeatleta, categoria
from palestra.atleta a1
join palestra.iscrizione i1 on atleta=codicea
join palestra.corso c1 on corso=codicec
where eta <= (
	select min(eta)
	from palestra.atleta
	join palestra.iscrizione i2 on atleta=codicea
	join palestra.corso on corso=codicec
	where i2.corso = i1.corso
);


/*_________________________________
e) All'interno dello schema 'palestra', creare una vista 'corsi_abbonamento_open' che contenga
i dati dei corsi che abbiano un numero di abbonamenti 'open' superiore a 3. Usando tale
vista, per ciascun corso con un numero di abbonamenti 'open' superiore a 3, selezionare: il
nome del corso, e l’eta dell’atleta più vecchio e di quello più giovane che sono iscritti a quel
corso. */

/* PART 1 WAY 1 */
create or replace view palestra.corsi_abbonamento_open as
select corso
from palestra.iscrizione
where abbonamento='open'
group by corso
having count(*) >= 3;

/* PART 2 WAY 1 */
select nomecorso, min(eta), max(eta)
from palestra.corso
join palestra.iscrizione on corso=codicec
join palestra.atleta on atleta=codicea
where codicec in (select corso from palestra.corsi_abbonamento_open)
group by nomecorso;

/* PART 1 WAY 2 */
create or replace view palestra.corsi_abbonamento_open2 as
select *
from palestra.corso
where codicec in (
	select corso
	from palestra.iscrizione
	group by corso
	having count(abbonamento='open') >= 3
);

/* PART 2 WAY 2 */
select corso, min(eta), max(eta)
from palestra.atleta
join palestra.iscrizione on codicea=atleta
where corso in (
	select codicec
	from palestra.corsi_abbonamento_open2
)
group by corso;
