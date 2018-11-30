/*3b) Interrogazioni – seconda parte: raggruppamento*/

/*____________________________________________________
h) Selezionare il codice di quei dipendenti che partecipano ai progetti con almeno tre ruoli
distinti.*/

select dipendente
from progetti.partecipa
group by dipendente
having count(distinct ruolo) >= 3;


/*____________________________________________________
i) Selezionare, per ogni dipendente e per ogni ruolo che ricopre, il numero di progetti in cui
ricopre quel ruolo.*/

/* VERIFICA VELOCE*/
select *
from progetti.partecipa
order by dipendente, ruolo;

/* GROUP BY*/
select dipendente, ruolo, count(ruolo)
from progetti.partecipa
group by dipendente, ruolo;


/*____________________________________________________
j) Selezionare, per ogni anno, il budget complessivo destinato ai progetti di quell'anno.*/


/*____________________________________________________
k) Selezionare, per ogni progetto a cui partecipano dipendenti per un numero complessivo di
mesi superiore a 15, il numero distinto di ruoli che partecipano a quel progetto.*/


/*____________________________________________________
l) Selezionare, per ogni progetto, il numero complessivo di mesi destinati ad ogni ruolo (tra
quelli che partecipano al progetto).*/


/*____________________________________________________
m) Selezionare il progetto a cui sono destinati complessivamente più mesi.*/


/*____________________________________________________
n) Selezionare i dati dei progetti cui partecipano almeno tre dipendenti che abitano a Cagliari o
a Sassari.*/
