/*3) Interrogazioni – prima parte (join multipli)*/

/*________________________________________________________________
a) Selezionare i dati dei prodotti disponibili nel magazzino 'M11', con il relativo prezzo,
ordinati in senso crescente rispetto alla categoria e, a parità di categoria, ordinati in senso
decrescente rispetto al prezzo.*/

/*LONG (prodotto cartesiano)
select prodotto.*, inventario.prezzo
	from prodotti.prodotto, prodotti.magazzino, prodotti.inventario
	where magazzino.codm = 'M11'
	and magazzino.codm = inventario.magazzino
	and inventario.prodotto = prodotto.codp
	order by categoria, prezzo desc;*/

/*SHORT (join)
select prodotti.prodotto.*, prezzo from prodotti.prodotto, prodotti.inventario
where codP = prodotto and magazzino='M11'
order by categoria, prezzo desc;*/


/*________________________________________________________________
b) Selezionare il codice e l’indirizzo dei magazzini di Milano in cui è presente almeno un
prodotto della categoria ‘elettrodomestici’ in quantità superiore a 20.*/

/*LONG (prodotto cartesiano)
--select prodotti.magazzino.codm, prodotti.magazzino.indirizzo
select codm as CodiceMagazzino, indirizzo
from prodotti.inventario, prodotti.magazzino, prodotti.prodotto
where magazzino.citta = 'Milano'
	--and magazzino.codm = inventario.magazzino
	--and prodotto.codp = inventario.prodotto
	and codm = magazzino
	and codp = prodotto
	and prodotto.categoria='elettrodomestici'
	and inventario.quantita > 20
;*/

/*SHORT (join)
select codm as CodiceMagazzino, indirizzo
from prodotti.prodotto
join prodotti.inventario on codP = prodotto
join prodotti.magazzino on codM = magazzino
where citta = 'Milano'
and categoria = 'elettrodomestici'
and quantita > 20
;*/


/*________________________________________________________________
c) Selezionare il codice e la città dei magazzini in cui sono presenti gli spaghetti.*/

/*LONG (prodotto cartesiano)
--select prodotti.magazzino.codm, prodotti.magazzino.citta
select codm as CodiceMagazzino, citta
from prodotti.inventario, prodotti.magazzino, prodotti.prodotto
where prodotto.nome='spaghetti'
	--and magazzino.codm = inventario.magazzino
	--and prodotto.codp = inventario.prodotto
	and codm = magazzino
	and codp = prodotto
;*/

/*SHORT (join)
select codm as CodiceMagazzino, citta
from prodotti.prodotto join prodotti.inventario on codp=prodotto
join prodotti.magazzino on magazzino=codm
where nome='spaghetti'*/


/* selezionare il codice del prodotto, la categoria, il codice del magazzino
e la quantita inclusi i prodotti che non sono presenti in inventario*/
-- insert into prodotti.prodotto values ('P24', 'carciofo', 'alimentari');
-- insert into prodotti.prodotto values ('P25', 'pizza', 'alimentari');

/*select codp, categoria, magazzino, quantita
from prodotti.prodotto left join prodotti.inventario on codp=prodotto
;*/

select codp, categoria, magazzino, citta, quantita
from prodotti.prodotto left join prodotti.inventario on codp=prodotto
left join prodotti.magazzino on codM=magazzino
;
