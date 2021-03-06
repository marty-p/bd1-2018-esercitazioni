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

select cognome, nome
from prestiti.cliente
where idcliente in (
	select cliente
	from prestiti.accordato_a
	group by cliente
	having count(cliente) >= 2
);

/* ALTERNATIVA MA NO */
select nome, cognome
from prestiti.cliente
join prestiti.accordato_a on idcliente=cliente
group by idcliente
having count(*) >= 2;


/*______________________________________________________
c) Selezionare i dati delle filiali che hanno concesso almeno due prestiti di importo superiore a
50000 euro.*/

select *
from prestiti.filiale
where idfiliale in (
	select filiale
	from prestiti.prestito
	where importo > 50000
	group by filiale
	having count(filiale) >= 2
);


/*______________________________________________________
d) Selezionare i dati delle filiali che non hanno concesso alcun prestito tra il 01/01/2000 e il
31/12/2005.*/

select *
from prestiti.filiale
where idfiliale not in (
	select distinct filiale
	from prestiti.prestito
	where data_accensione between '2000/01/01' and '2005/12/31'
);


/*______________________________________________________
e) Selezionare i dati delle filiali che hanno concesso prestiti esclusivamente a clienti residenti
nella propria città.*/

/* MIA */
select distinct prestiti.filiale.*
from prestiti.prestito
join prestiti.accordato_a on idprestito=prestito
join prestiti.filiale on filiale=idfiliale
join prestiti.cliente on accordato_a.cliente=idcliente
where cliente.citta_residenza = filiale.citta
and filiale not in (
	select distinct idfiliale
	from prestiti.prestito
	join prestiti.accordato_a on idprestito=prestito
	join prestiti.filiale on filiale=idfiliale
	join prestiti.cliente on accordato_a.cliente=idcliente
	where cliente.citta_residenza <> filiale.citta
);

/* TUTOR */
select *
from prestiti.filiale
where idfiliale not in (
	select filiale
	from prestiti.prestito
	join prestiti.filiale on idfiliale=filiale
	join prestiti.accordato_a on prestito=idprestito
	join prestiti.cliente on idcliente=cliente
	where citta <> citta_residenza
) and idfiliale in (
	select filiale from prestiti.prestito
);


/*______________________________________________________
f) Selezionare l’identificativo della filiale che complessivamente ha concesso in prestito la
somma più elevata.*/

select filiale
from prestiti.prestito
group by filiale
having sum(importo) >= ALL (
	select sum(importo)
	from prestiti.prestito
	group by filiale
);


/*______________________________________________________
g) Selezionare gli identificativi delle filiali per cui il totale dei prestiti accordati supera il 50%
dell’importo massimo che può essere concesso in prestito dalla filiale.*/

/* MIA */
select filiale
from prestiti.prestito
group by filiale
having sum(importo) > (
	select importo_max/2
	from prestiti.filiale
	where filiale = idfiliale
);

/* TUTOR */
select filiale
from prestiti.prestito P1
group by filiale
having sum(importo) > 0.5*(
	select importo_max
	from prestiti.filiale P2
	where P1.filiale = P2.idfiliale
);


/*______________________________________________________
h) Per ogni prestito accordato a più di un cliente, determinare il numero di città diverse in cui
risiedono i clienti cui è stato accordato quel prestito.*/

/* MIA */
select count(distinct citta_residenza)
from prestiti.cliente
join prestiti.accordato_a on cliente = idcliente
where prestito in (
	select prestito
	from prestiti.accordato_a
	group by prestito
	having count(prestito) > 1
)
group by citta_residenza;

/* TUTOR */
select prestito, count(distinct citta_residenza)
from prestiti.accordato_a
join prestiti.cliente on cliente=idcliente
group by prestito
having count(*) > 1;

