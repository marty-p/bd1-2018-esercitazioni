/*3) Interrogazioni*/

/*______________________________________________________
a) Selezionare i dati dei clienti a cui è stato accordato almeno un prestito da una filiale non
situata nella città in cui risiedono, ordinati in senso crescente rispetto al cognome (prima) e
al nome (poi).*/

select prestiti.cliente.*
from prestiti.cliente
join prestiti.accordato_a on idcliente=cliente
join prestiti.prestito on idprestito=prestito
join prestiti.filiale on idfiliale=filiale
where citta <> citta_residenza
order by cognome, nome;


/*______________________________________________________
b) Selezionare il cognome e il nome dei clienti a cui sono stati accordati almeno due prestiti.*/


/*______________________________________________________
c) Selezionare i dati delle filiali che hanno concesso almeno due prestiti di importo superiore a
50000 euro.*/


/*______________________________________________________
d) Selezionare i dati delle filiali che non hanno concesso alcun prestito tra il 01/01/2000 e il
31/12/2005.*/


/*______________________________________________________
e) Selezionare i dati delle filiali che hanno concesso prestiti esclusivamente a clienti residenti
nella propria città.*/


/*______________________________________________________
f) Selezionare l’identificativo della filiale che complessivamente ha concesso in prestito la
somma più elevata.*/


/*______________________________________________________
g) Selezionare gli identificativi delle filiali per cui il totale dei prestiti accordati supera il 50%
dell’importo massimo che può essere concesso in prestito dalla filiale.*/


/*______________________________________________________
h) Per ogni prestito accordato a più di un cliente, determinare il numero di città diverse in cui
risiedono i clienti cui è stato accordato quel prestito.*/

