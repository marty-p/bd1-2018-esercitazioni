/*3b) Interrogazioni – seconda parte: raggruppamento*/

/*____________________________________________________
h) Selezionare il codice di quei dipendenti che partecipano ai progetti con almeno tre ruoli
distinti.*/

/* USANDO DISTINCT
select dipendente
from progetti.partecipa
group by dipendente
having count(distinct ruolo) >= 3;*/


/*____________________________________________________
i) Selezionare, per ogni dipendente e per ogni ruolo che ricopre, il numero di progetti in cui
ricopre quel ruolo.*/

/* VERIFICA VELOCE CON ORDER BY
select *
from progetti.partecipa
order by dipendente, ruolo;*/

/* USANDO GROUP BY
select dipendente, ruolo, count(ruolo)
from progetti.partecipa
group by dipendente, ruolo;*/


/*____________________________________________________
j) Selezionare, per ogni anno, il budget complessivo destinato ai progetti di quell'anno.*/

/*select anno, sum(budget)
from progetti.progetto
group by anno;*/


/*____________________________________________________
k) Selezionare, per ogni progetto a cui partecipano dipendenti per un numero complessivo di
mesi superiore a 15, il numero distinto di ruoli che partecipano a quel progetto.*/

/* VERIFICA VELOCE
select *
from progetti.partecipa
order by progetto, mesi*/

/* USANDO DISTINCT
select progetto, count(distinct ruolo)
from progetti.partecipa
group by progetto
having sum(mesi) > 15;*/


/*____________________________________________________
l) Selezionare, per ogni progetto, il numero complessivo di mesi destinati ad ogni ruolo (tra
quelli che partecipano al progetto).*/

select progetto, ruolo, sum(mesi)
from progetti.partecipa
group by progetto, ruolo
order by progetto, ruolo;


/*____________________________________________________
m) Selezionare il progetto a cui sono destinati complessivamente più mesi.*/


/*____________________________________________________
n) Selezionare i dati dei progetti cui partecipano almeno tre dipendenti che abitano a Cagliari o
a Sassari.*/
