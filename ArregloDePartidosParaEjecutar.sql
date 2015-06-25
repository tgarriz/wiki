--Arreglo de tabla parcelas comentado
--Asigno permisos de consuta a usuario consulta para todo el schema public
grant select on all tables in schema public to consulta;

--elimino parcelas reunidas
delete from only parcelas p using parcelas_reunion r
where ST_intersects(ST_centroid(r.geom),p.geom);

--inserto  parcelas reunidas
insert into parcelas (nomencla,partido,etiqueta,rural,partida,caracteris,geom)
	      select nomencla,partido,etiqueta,rural,partida,caracteris,geom from parcelas_reunion;

--agrego columna plano
ALTER TABLE parcelas ADD COLUMN plano character varying(14);

--Vinculo los planos
update parcelas pc 
set plano = pl.plano
from planospos2000 pl 
where pc.nomencla = pl.nomencla and pc.plano is null;

update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pc.nomencla = pl.nomencla and pc.plano is null;

--Arreglo de Pte Peron
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '032' || substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 129) and pl.circ = 'III';

--Arreglo de Pte Peron2
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '030' || substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 129) and pl.circ = 'V';

--Arreglo de Pte Peron3
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '100' || substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 129) and pl.circ in('II', 'VII', 'VIII');

--partido 55 --> partidos 114 y 115
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '055'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 114, 115);

--partido 27 --> partidos 137
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '027'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 137);

--partido 86 --> partidos 120
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '086'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 120);

--partido 42 --> partidos 123
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '042'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(123);

--partido 39 --> partidos 124, 125
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '039'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(124,125);

--partido 47 --> partidos 117
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '047'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(117);

--partido 84 --> partidos 118
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '084'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(118);

--partido 10 --> partidos 121
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '010'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(121);

--partido 81 --> partidos 122
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '081'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(122);

--partido 22 --> partidos 126
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '022'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(126);

--partido 81 --> partidos 127
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '081'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(127);

--partido 44 --> partidos 128
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '044'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(128);

--partido 81 --> partidos 127
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '081'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(127);

--partido 30 --> partidos 130
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '030'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(130);

--partido 48 --> partidos 131, 132, 133
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '048'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(131,132,133);

--partido 65 --> partidos 134
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '065'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(134);

--partido 101 --> partidos 135 136
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '101'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in(135, 136 );

--partido 27 --> partidos 137
update parcelas pc 
set plano = pl.plano
from planosant2000 pl 
where pl.nomencla = '027'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 137);

--partido 27 --> partidos 137 (pos)
update parcelas pc 
set plano = pl.plano
from planospos2000 pl 
where pl.nomencla = '027'|| substr(pc.nomencla,4,39) and pc.plano is null and pc.partido in( 137);