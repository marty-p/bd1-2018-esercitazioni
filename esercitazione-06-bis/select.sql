/*4) Uso delle viste nelle interrogazioni
 Facendo uso delle viste precedentemente definite, formulare le seguenti interrogazioni:*/

/*___________________________________________
e) Per ciascun immobile ancora invenduto, determinare il numero di volte in cui è stato
visitato.*/

/* MIA */
select codi, count(visita.codi)
from immobili.immobile_invenduto
natural left join immobili.visita
group by codi;

/* TUTOR */
select codi, count(coda) as num_visite_immobile
from immobili.visita
where codi in (
	select codi
	from immobili.immobile_invenduto
)
group by codi;

/* TUTOR ALT */
select codi, count(coda) as num_visite_immobile
from immobili.visita
natural right join immobili.immobile_invenduto
group by codi;


/*___________________________________________
f) Selezionare i dati degli agenti che hanno effettuato almeno due visite ma nessuna vendita.*/

/* MIA */
select agente.* from immobili.statistiche
natural join immobili.agente
where num_visite >= 2 and num_vendite = 0;

/* TUTOR */
select * from immobili.agente
where coda in (
	select coda from immobili.statistiche
	where num_visite >= 2 and num_vendite = 0
);


/*___________________________________________
g) Per ciascun agente che ha effettuato almeno due visite e almeno due vendite, determinare la
data dell’ultima visita effettuata e la data dell’ultima vendita effettuata.*/

select VI.coda, max(VE.data) as ultima_data_vendita, max(VI.data) as ultima_data_visita
from immobili.vendita VE
join immobili.visita VI on VI.coda = VE.coda
where VE.coda in (
	select coda from immobili.statistiche
	where num_visite >= 2 and num_vendite >= 2
)
group by VI.coda;


/*___________________________________________
h) Determinare, fra tutti gli immobili invenduti, quali sono quelli più cari per la zona e il tipo a
cui si riferiscono (ovvero il più caro degli appartamenti invenduti in zona residenziale, il più
caro degli appartamenti invenduti in centro, etc...). */

/* MIA */
select tipo, zona, max(prezzo_richiesto)
from immobili.immobile_invenduto
group by tipo, zona;

/* TUTOR */
select tipo, zona, codi
from immobili.immobile_invenduto i1
where prezzo_richiesto = (
	select max(prezzo_richiesto)
	from immobili.immobile_invenduto i2
	where i1.tipo=i2.tipo and i1.zona=i2.zona
);

