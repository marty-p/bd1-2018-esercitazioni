
/*3) Definizione di viste
 Definire all’interno dello schema immobili:*/

/*___________________________________________
a) una vista “immobile_invenduto” che contiene i dati di tutti gli immobili ancora invenduti;*/
create or replace view immobili.immobile_invenduto
as select *
from immobili.immobile
where codi not in (
	select codi
	from immobili.vendita
);

select * from immobili.immobile_invenduto;


/*___________________________________________
b) una vista “statistiche_visite” che contiene, per ogni agente, il codice dell’agente (attributo
“codA”), l’agenzia presso cui l’agente lavora (attributo “agenzia”), il numero di visite
effettuate dall’agente (attributo “num_visite”) e il numero di immobili distinti visitati
dall’agente (attributo “num_immobili_visitati”);*/


/*___________________________________________
c) una vista “statistiche_vendite” che contiene, per ogni agente, il codice dell’agente (attributo
“codA”), l’agenzia presso cui l’agente lavora (attributo “agenzia”), il numero di vendite
effettuate dall’agente (attributo “num_vendite”) e la somma persa dall’agenzia per le vendite
effettuate dall’agente, ovvero lo scarto tra i prezzi di vendita richiesti e quelli effettivamente
ottenuti mediante la vendita (attributo “somma_persa”);*/

/*___________________________________________
d) una vista “statistiche” che contiene, per ogni agente, il codice dell’agente (attributo “codA”),
l’agenzia presso cui l’agente lavora (attributo “agenzia”), il numero di visite effettuate
dall’agente (attributo “num_visite”), il numero di immobili distinti visitati dall’agente
(attributo “num_immobili_visitati”), il numero di vendite effettuate dall’agente (attributo
“num_vendite”) e la somma persa dall’agenzia per le vendite effettuate dall’agente, ovvero
lo scarto tra i prezzi di vendita richiesti e quelli effettivamente ottenuti mediante la vendita
(attributo “somma_persa”). */
