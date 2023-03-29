select nombre from producto; 
select nombre,precio from producto; 
select * from producto;
Select nombre,precio,(precio*1.07) from producto; 
select nombre,precio as euro,(precio*1.07) as dolar from producto; 
select upper(nombre), precio  from producto;    
select lower(nombre), precio  from producto;
select nombre, upper(left (nombre,2)) from fabricante;
select nombre, (round(precio)) as precio_round from producto;
select nombre, precio, truncate(precio,0) as precio_truncate from producto;
select codigo_fabricante from producto;
select distinct codigo_fabricante from producto;
select  nombre from fabricante order by nombre asc;
select  nombre from fabricante order by nombre desc;      
select nombre, precio from producto order by nombre asc, precio desc;
select * from producto limit 0,5;
select * from fabricante limit 3,2;	
select nombre, precio from producto order by precio asc limit 0,1;   
select nombre, precio from producto order by precio desc limit 0,1;    
select nombre, codigo_fabricante from producto where codigo_fabricante=2;	 
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo;      
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo order by f.nombre asc;      
select p.codigo, p.nombre, p.codigo_fabricante, f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo;  
    
    