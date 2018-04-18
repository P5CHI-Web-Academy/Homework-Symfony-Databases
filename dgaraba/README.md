
#### Cereri

- Inserarea unui student
insert into studenti(idnp, nume_student, prenume_student, id_grupa, data_nasterii, data_inmatricularii, strada, email, telefon)
values(200234521456, 'Grecu', 'Ilinca', 4, '10-12-1996', '26-08-2015', 'Miron Costin 20', 'ilincag@gmai.com', 68504763);

- Afișarea detaliilor despre un student
select * from studenti where idnp=200234521456;

- Modificarea unui student
update studenti set id_grupa=5 where idnp=200234521456;

- Afișarea top 10 studenți cu cea mai bună notă medie
select nume_student, prenume_student, nota_medie
from studenti
inner join note
on idnp=id_student
order by nota_medie desc limit 10;

- Top studenți per materie
select m.denumire, s.nume_student, s.prenume_student, max(nota_examen) as nota_examen
from studenti as s
inner join note as n
on s.idnp=n.id_student
inner join materii as m
on n.id_materii=m.id
group by n.id_materie;

- Afișarea listei de profesori care predau unui anumit student
select m.nume_profesor, m.prenume_profesor
from materii as m
inner join studenti as s
on m.id_grupa=s.id_grupa
where s.idnp=200234521456;