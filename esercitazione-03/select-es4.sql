/*4) Interrogazioni – seconda parte (query nidificate)*/


/*________________________________________________________________
d) Selezionare il codice dei magazzini attualmente vuoti (che non contengono cioè nessun
prodotto).*/

/*select codM
from prodotti.magazzino
where codM not in (
	select distinct magazzino from prodotti.inventario
);*/


/*________________________________________________________________
e) Selezionare il codice dei magazzini che non contengono nessun prodotto della categoria
‘alimentari’, magazzini vuoti compresi.*/

/* NESTED x2
select codM
from prodotti.magazzino
--where codM <> ALL (
where codM not in (
	select magazzino
	from prodotti.inventario
	where prodotto = ANY(
		select codP
		from prodotti.prodotto
		where categoria='alimentari'
	)
);*/

/* NESTED & JOIN
select codM
from prodotti.magazzino
where codM <> ALL (
	select magazzino
	from prodotti.inventario join prodotti.prodotto on codP=prodotto
	where categoria='alimentari'
);*/


/*________________________________________________________________
f) Selezionare il codice dei magazzini che non contengono nessun prodotto della categoria
‘alimentari’, magazzini vuoti esclusi.*/

/* LONG
select codM
from prodotti.magazzino
where codM not in (
	select magazzino
	from prodotti.inventario join prodotti.prodotto on codP=prodotto
	where categoria='alimentari')
and exists (
	select * from prodotti.inventario where codM=magazzino
);*/

/* SHORT
select distinct magazzino
from prodotti.inventario
where magazzino not in (
	select magazzino
	from prodotti.inventario join prodotti.prodotto on codP=prodotto
	where categoria='alimentari'
);*/

/* SHORT & EXIST
select distinct magazzino
from prodotti.inventario I1
where not exists (
	select magazzino
	from prodotti.inventario I2 join prodotti.prodotto on codP=prodotto
	where categoria='alimentari' and I1.magazzino=I2.magazzino
);*/


/*________________________________________________________________
g) Selezionare il codice dei magazzini che contengono solo prodotti della categoria
‘alimentari’.*/

/* EXIST (bug: mostra anche i magazzini vuoti)
select distinct magazzino
from prodotti.inventario I1
where not exists (
	select magazzino
	from prodotti.inventario I2 join prodotti.prodotto on codP=prodotto
	where categoria<>'alimentari' and I1.magazzino=I2.magazzino
);*/

/* IN
select distinct magazzino
from prodotti.inventario
where magazzino not in (
	select distinct magazzino
	from prodotti.inventario I1
	where prodotto = ANY (
		select codP
		from prodotti.prodotto
		where categoria <> 'alimentari'
	)
);*/


/*________________________________________________________________
h) Selezionare il codice dei prodotti che sono presenti in almeno due magazzini.*/

/* NESTED
select distinct prodotto
from prodotti.inventario I1
where EXISTS (
	select *
	from prodotti.inventario I2
	where I1.magazzino <> I2.magazzino
	and I1.prodotto = I2.prodotto
);*/

/* JOIN
select distinct I1.prodotto
from prodotti.inventario I1, prodotti.inventario I2
where I1.magazzino <> I2.magazzino
and I1.prodotto = I2.prodotto;*/

/* COUNT (non richiesto)
select prodotto
from prodotti.inventario
group by prodotto
having count(prodotto) >= 2;*/
