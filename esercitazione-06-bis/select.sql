/*4) Uso delle viste nelle interrogazioni
 Facendo uso delle viste precedentemente definite, formulare le seguenti interrogazioni:*/

/*___________________________________________
e) Per ciascun immobile ancora invenduto, determinare il numero di volte in cui è stato
visitato.*/
select codi, count(visita.codi)
from immobili.immobile_invenduto
natural join immobili.visita
group by codi;


/*___________________________________________
f) Selezionare i dati degli agenti che hanno effettuato almeno due visite ma nessuna vendita.*/

/*___________________________________________
g) Per ciascun agente che ha effettuato almeno due visite e almeno due vendite, determinare la
data dell’ultima visita effettuata e la data dell’ultima vendita effettuata.*/

/*___________________________________________
h) Determinare, fra tutti gli immobili invenduti, quali sono quelli più cari per la zona e il tipo a
cui si riferiscono (ovvero il più caro degli appartamenti invenduti in zona residenziale, il più
caro degli appartamenti invenduti in centro, etc...). */
