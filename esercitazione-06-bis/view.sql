
/*3) Definizione di viste
 Definire all’interno dello schema immobili:*/

/*___________________________________________
a) una vista “immobile_invenduto” che contiene i dati di tutti gli immobili ancora invenduti;*/
create or replace view immobili.immobile_invenduto as
select *
from immobili.immobile
where codi not in (
	select codi
	from immobili.vendita
);

-- then
select * from immobili.immobile_invenduto;


/*___________________________________________
b) una vista “statistiche_visite” che contiene, per ogni agente, il codice dell’agente (attributo
“codA”), l’agenzia presso cui l’agente lavora (attributo “agenzia”), il numero di visite
effettuate dall’agente (attributo “num_visite”) e il numero di immobili distinti visitati
dall’agente (attributo “num_immobili_visitati”);*/

/* MIA */
create or replace view statistiche_visite as
select count(codi) as num_visite, count(distinct codi) as num_immobili_visitati, agente.coda, agenzia
from immobili.visita
join immobili.agente on agente.coda=visita.coda
group by agente.coda;

/* TUTOR */
create or replace view immobili.statistiche_visite as
select coda, agenzia, count(codi) as num_visite, count(distinct codi) as num_immobili_visitati
from immobili.agente
natural left join immobili.visita
group by coda;

-- then
select * from immobili.statistiche_visite;


/*___________________________________________
c) una vista “statistiche_vendite” che contiene, per ogni agente, il codice dell’agente (attributo
“codA”), l’agenzia presso cui l’agente lavora (attributo “agenzia”), il numero di vendite
effettuate dall’agente (attributo “num_vendite”) e la somma persa dall’agenzia per le vendite
effettuate dall’agente, ovvero lo scarto tra i prezzi di vendita richiesti e quelli effettivamente
ottenuti mediante la vendita (attributo “somma_persa”);*/

/* MIA incompleta */
create or replace view immobili.statistiche_vendite as
select coda, agente, count(codi) as num_vendite, prezzo_richiesto - prezzo as somma_perso
from immobili.vendita
join immobili.agente
join immobili.immobile on codi=codi
group by codi;

/* TUTOR */
create or replace view immobili.statistiche_vendite as
select coda, agenzia, count(codi) as num_vendite, sum(prezzo_richiesto - prezzo) as somma_perso
from immobili.agente
natural left join immobili.vendita
natural left join immobili.immobile
group by coda, agenzia;


/*___________________________________________
d) una vista “statistiche” che contiene, per ogni agente, il codice dell’agente (attributo “codA”),
l’agenzia presso cui l’agente lavora (attributo “agenzia”), il numero di visite effettuate
dall’agente (attributo “num_visite”), il numero di immobili distinti visitati dall’agente
(attributo “num_immobili_visitati”), il numero di vendite effettuate dall’agente (attributo
“num_vendite”) e la somma persa dall’agenzia per le vendite effettuate dall’agente, ovvero
lo scarto tra i prezzi di vendita richiesti e quelli effettivamente ottenuti mediante la vendita
(attributo “somma_persa”). */
