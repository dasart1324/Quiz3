  Create view ventas_regiones AS
  select nombre, plataforma, año, genero, editorial, region, ventas
  from (Select nombre, plataforma, año, genero, editorial, ventas_NA as Norteamerica, ventas_EU as Europa, ventas_JP as Japon, ventas_Otros as Otros from videojuegos) v
  unpivot (ventas for region in (Norteamerica, Europa, Japon, Otros)) as unpvt;;

select * from ventas_regiones