-- Centro que más ha vacunado
select 	c.centro_dsc
		,sum(cantidad_aplicaciones) cantidad
from 	public.fact_vacunacion f
inner join public.dim_centro c on f.centro_key = c.centro_key
group by c.centro_dsc
order by cantidad desc

-- Cantidad de dosis aplicadas mensualmente durante el año 2021
select	t.anio
		,t.mes
        ,sum(cantidad_aplicaciones) cantidad
from 	public.fact_vacunacion f
inner join public.dim_tiempo t on f.tiempo_key = t.tiempo_key
where	t.anio = 2021
group by t.anio, t.mes
order by t.mes

-- Cantidad de Mujeres y Hombres Vacunados
select	s.sexo_dsc
		,sum(cantidad_aplicaciones) cantidad
from public.fact_vacunacion f
inner join public.dim_sexo s on f.sexo_key = s.sexo_key
group by s.sexo_dsc

-- Que tipo de Vacuna es la que más se ha aplicado
select 	tv.tipovacuna_dsc
		,sum(cantidad_aplicaciones) cantidad
from 	public.fact_vacunacion f
inner join public.dim_tipovacuna tv on f.tipovacuna_key = tv.tipovacuna_key
group by tv.tipovacuna_dsc
order by cantidad desc

-- La cantidad de vacunas aplicadas por número de dosis
select 	d.dosis_dsc
		,sum(cantidad_aplicaciones) cantidad
from 	public.fact_vacunacion f
inner join public.dim_dosis d on f.dosis_key = d.dosis_key
group by d.dosis_dsc
order by cantidad desc