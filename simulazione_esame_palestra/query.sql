/*3) Interrogazioni SQL e viste
Scrivere il codice SQL per effettuare le seguenti operazioni:
*/

/*_________________________________
a) Selezionare nome, cognome e categoria degli atleti maggiorenni (età maggiore o uguale a
18) iscritti a corsi tenuti dall’istruttore 'Roberto', ordinati per nome ed eliminando i duplicati.*/

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

/*_________________________________
b) Selezionare il codice delle coppie di atleti che hanno stesso nome ma che appartengono a
categorie diverse.*/

/*_________________________________
c) Selezionare, per ogni corso a cui sono iscritti almeno 3 atleti diversi, il nome del corso e
l’eta media degli atleti iscritti a quel corso.*/


/*_________________________________
d) Selezionare, per ogni corso: il nome del corso, e il nome, il cognome e la categoria
dell’atleta più giovane iscritto a quel corso.*/


/*_________________________________
e) All'interno dello schema 'palestra', creare una vista 'corsi_abbonamento_open' che contenga
i dati dei corsi che abbiano un numero di abbonamenti 'open' superiore a 3. Usando tale
vista, per ciascun corso con un numero di abbonamenti 'open' superiore a 3, selezionare: il
nome del corso, e l’eta dell’atleta più vecchio e di quello più giovane che sono iscritti a quel
corso. */
