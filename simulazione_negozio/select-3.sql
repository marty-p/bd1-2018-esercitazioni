/*3) Interrogazioni SQL e viste
Scrivere il codice SQL per effettuare le seguenti operazioni:*/

/*___________________________________________________________
a) Selezionare nome, marca e categoria dei prodotti presenti in vetrine del reparto 'donna' il cui
prezzo sia inferiore a 130, ordinati per marca ed eliminando i duplicati.*/

select distinct nomeProdotto, marca, categoria
from negozio.prodotto
where prezzo < 130
and codicep in (
	select prodotto
	from negozio.presenza
	join negozio.vetrina on vetrina = codicev
	join negozio.prodotto on prodotto = codicep
	where nomeReparto = 'donna'
)
order by marca;

/*___________________________________________________________
b) Selezionare la metratura della vetrina più piccola in cui è presente almeno un prodotto di
marca 'Trussardi'.*/


/*___________________________________________________________
c) Selezionare i dati delle vetrine che vendono esclusivamente prodotti il cui costo sia
superiore al costo medio dei prodotti*/


/*___________________________________________________________
d) Selezionare i dati dei prodotti che sono presenti in almeno 2 vetrine, esclusi i prodotti
presenti nelle vetrine il cui reparto è ‘bambino’*/


/*___________________________________________________________
e) Selezionare il codice delle coppie di prodotti che sono venduti dalla stessa vetrina.*/

