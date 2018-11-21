/*(a) i dati relativi agli esami il cui voto è minore di 21 o maggiore di 27 */
select * from segreteria.esami where voto < 21 or voto > 27;
select * from segreteria.esami where voto <> ALL('{21,22,23,24,25,26,27}');
select * from segreteria.esami where voto not between 21 and 27;

/*(b) il codice e il cognome dei docenti di cui non è noto l’indirizzo *7
select cod_docente, cognome from segreteria.docenti where indirizzo is null;

/*(c) la matricola degli studenti il cui cognome inizia con ‘M’ o ‘N’ e termina con ‘i’ */
select matricola from segreteria.studenti where cognome LIKE 'M%i' or cognome LIKE 'N%i';
select matricola from segreteria.studenti where cognome LIKE ANY(array['M%i','N%i']);
select matricola from segreteria.studenti where cognome between 'M%i' and 'N%i';

/*(d) la matricola degli studenti che hanno sostenuto nel 2006 o nel 2007
 un esame con voto pari a 30 o 33 (lode) */
select studente from segreteria.esami where extract(year from data) in (2006, 2007) and voto in (30, 33);
select studente from segreteria.esami where data >= '2006-01-01' and data <= '2007-12-31' and voto in (30, 33);
select studente from segreteria.esami where data between '2006/01/01' and '2007/12/31' and voto in (30, 33);

/*(e) il cognome e il nome degli studenti nati prima del 1984,
 con l’eliminazione di eventuali duplicati*/
select distinct cognome,nome from segreteria.studenti where extract(year from data_nascita) < 1984;
select distinct cognome,nome from segreteria.studenti where data_nascita < '1984-01-01';
select distinct cognome,nome from segreteria.studenti where data_nascita < '1984/01/01';

/*(f) i dati di tutti gli studenti del biennio, ordinati in modo decrescente rispetto all’età e,
 a parità di età, ordinati in modo crescente rispetto al cognome (prima) e al nome (poi) */
select * from segreteria.studenti where anno_corso <= 2 order by data_nascita desc, cognome asc, nome asc; /*errato ma corretto*/
select * from segreteria.studenti where anno_corso <= 2 order by data_nascita, cognome, nome;
select * from segreteria.studenti where anno_corso <= 2 order by extract(year from data_nascita), cognome, nome;
