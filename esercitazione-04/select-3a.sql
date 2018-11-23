/*____________________________________________________________
3a) Interrogazioni – prima parte: funzioni aggregate, subquery*/

/*____________________________________________________________
a) Selezionare il budget più alto, più basso, e medio dei progetti.*/

/* FNCs
select max(budget), min(budget), avg(budget)
from progetti.progetto;*/

/* FNCs + ALIAS
select max(budget) as BudgetMax,
	min(budget) as BudgetMin,
	avg(budget) as BudgetAvg
from progetti.progetto;*/


/*____________________________________________________________
b) Selezionare il nome del progetto col budget più elevato.*/

/* LIMIT
select nome from progetti.progetto order by budget desc limit 1;*/

/* GROUP BY*/
select nome from progetti.progetto
where budget = (
	select max(budget)
	from progetti.progetto
);


/*____________________________________________________________
c) Selezionare il nome dei progetti il cui budget è superiore alla media.*/


/*____________________________________________________________
d) Selezionare i dati dei progetti cui partecipano almeno un dipendente di Cagliari e un
dipendente di Sassari.*/


/*____________________________________________________________
e) Selezionare il cognome e il nome dei dipendenti che non partecipano a nessun progetto
iniziato prima del 2005.*/


/*____________________________________________________________
f) Selezionare il cognome e il nome dei dipendenti che partecipano esclusivamente a progetti
del 2005.*/


/*____________________________________________________________
g) Per ogni dipendente (che ha preso parte ad almeno un progetto), selezionare il codice del
progetto in cui egli ha lavorato per il maggior numero di mesi.*/

