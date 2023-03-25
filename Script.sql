USE tienda;

/*Base de datos Tienda*/

/*1. Lista el nombre de todos los productos que hay en la tabla producto.*/
	select nombre from producto; 

/*2.Lista los nombres y los precios de todos los productos de la tabla producto.*/
	select nombre,precio from producto; 

/*3. Lista todas las columnas de la tabla.*/
	select * from producto;

/*4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).*/
Select nombre,precio,(precio*1.07) from producto; 

/*5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
 Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.*/
	select nombre,precio as euro,(precio*1.07) as dolar from producto; 
 
/*6. Lista los nombres y los precios de todos los productos de la tabla, convirtiendo los nombres a mayúscula.*/
	select upper(nombre), precio  from producto;
    
/*7. Lista los nombres y los precios de todos los productos de la tabla, convirtiendo los nombres a minúscula.*/
	select lower(nombre), precio  from producto;
    
/*8.Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.*/
	

/*9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.*/
	select nombre, (round(precio)) as precio_round from producto;

/*10. Lista los nombres y los precios de todos los productos de la tabla, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/
	select nombre, precio, truncate(precio,0) as precio_truncate from producto;

/*11. Lista el código de los fabricantes que tienen productos en la tabla producto.*/
	select codigo_fabricante from producto;

/*12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.*/
	select distinct codigo_fabricante from producto;

/*13. Lista los nombres de los fabricantes ordenados de manera ascendente.*/
	select  nombre from fabricante order by nombre asc;

/*14. Lista los nombres de los fabricantes ordenados de manera descendente.*/
	select  nombre from fabricante order by nombre desc;

/*15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de manera 
	  ascendente y, en segundo lugar, por el precio de manera descendente.*/
      
      
/*16. Devuelve una lista con las 5 primeras filas de la tabla.*/
	select * from producto limit 0,5;

/*17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla. 
La cuarta fila también debe incluirse en la respuesta.*/
	select * from producto limit 3,2;

/*18. Lista el nombre y el precio del producto más barato. (Utiliza solamente las cláusulas ORDER BY y LIMIT).
	  NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.*/
	
    select nombre, precio from producto order by precio asc limit 0,1;
      
/*19. Lista el nombre y el precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT).
	  NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY. */
      
	select nombre, precio from producto order by precio desc limit 0,1;
    
/*20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.*/
	
    select nombre, codigo_fabricante from producto where codigo_fabricante=2;
	
/*21. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.*/
	 
     select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo;
    
/*22. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
	  Ordena el resultado por el nombre del fabricante, por orden alfabético.*/
      
      select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo order by f.nombre asc;
      
/*23. Devuelve una lista con el código del producto, nombre del producto, código del fabricador y nombre del fabricador,
 de todos los productos de la base de datos.*/
    
	  select p.codigo, p.nombre, p.codigo_fabricante, f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo;


/*****************************/
/* Base de datos Universidad */     
/*****************************/

use universidad;

/*1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los/as alumnos/ as. El listado
 deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.*/
	
  select apellido1, apellido2, nombre from persona order by apellido1 asc, apellido2 asc, nombre asc;  
    
/*2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos. */

	select nombre, apellido1, apellido2 from persona where tipo = 'alumno' and telefono is null;
	
/*3.Devuelve el listado de los alumnos que nacieron en 1999.*/
	select * from persona where tipo = 'alumno' and year(fecha_nacimiento) = '1999';
    
/*4. Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF acaba en K. */

	select * from persona where tipo = 'profesor' and telefono is null and nif like '%k';
    
/*5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.*/

	select * from universidad.asignatura where id and curso = 3 and cuatrimestre=1 and id_grado = 7 ;
	
/*6. Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro 
     columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente menor a mayor por
     los apellidos y el nombre.*/
	
	select   per.apellido1, per.apellido2, per.nombre, dep.nombre from 	profesor prof 
    join persona per on prof.id_profesor = per.id
    join departamento dep on prof.id_departamento = dep.id
    order by  per.apellido1 asc, per.apellido2 asc, per.nombre asc;
    
/*7. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.*/
    
    select persona.nif, asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
    from alumno_se_matricula_asignatura 
    join persona on alumno_se_matricula_asignatura.id_alumno = persona.id 
    join asignatura on alumno_se_matricula_asignatura.id_asignatura= asignatura.id
    join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id
    where  persona.nif ='26902806M';
      
/*8. Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en
	 Ingeniería Informática (Plan 2015).*/
   
    select   distinct dep.nombre  from profesor prof 
    join departamento dep on prof.id_departamento = dep.id
    join asignatura asi on prof.id_profesor = asi.id_profesor
    join grado gra on asi.id_grado = gra.id
    where gra.nombre= 'Grado en Ingeniería Informática (Plan 2015)';
   
/*9. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.*/
	
    select distinct  persona.id, persona.nombre, curso_escolar.anyo_inicio
    from alumno_se_matricula_asignatura 
    join persona on alumno_se_matricula_asignatura.id_alumno = persona.id 
    join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id
    where curso_escolar.anyo_inicio = '2018'; 
    
    

/****************************************************************************************/
/* Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN. */     
/****************************************************************************************/

/*1. Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. El listado también
 debe mostrar a aquellos profesores/as que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre
 del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor
 a mayor por el nombre del departamento, apellidos y el nombre.*/
	
    select dep.nombre, per.apellido1, per.apellido2, per.nombre from profesor pro 
    left join persona per on pro.id_profesor = per.id
    left join departamento dep on pro.id_departamento = dep.id;
        
/*2. Devuelve un listado con los profesores/as que no están asociados a un departamento.*/
	
    select prof.id_profesor from profesor prof 
    left join departamento dep 
	on prof.id_departamento = dep.id
    where prof.id_departamento is null;
    
/*3. Devuelve un listado con los departamentos que no tienen profesores/as asociados.*/
	
	select distinct dep.nombre from profesor prof 
    right join departamento dep 
	on prof.id_departamento = dep.id
    where prof.id_departamento is null;
    
/*4. Devuelve un listado con los profesores/as que no imparten ninguna asignatura.*/
	
    select per.nombre, prof.id_profesor from profesor prof
    left join persona per on prof.id_profesor = per.id
    left join asignatura asi  on prof.id_profesor = asi.id_profesor
	where asi.id_profesor is null;

/*5. Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.*/

    select asi.* from asignatura asi 
    left join profesor prof on asi.id_profesor = prof.id_profesor
    where asi.id_profesor is null;
    
/*6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar*/
	    
	select dep.nombre from profesor prof 
    right join departamento dep on prof.id_departamento= dep.id;
    
/***********************/
/* Consultas resumen:  */     
/***********************/

/*1. Devuelve el número total de alumnos que hay.*/
	
    select count(*) as cantidad_alumnos from persona  where tipo = 'alumno';

/*2. Calcula cuántos alumnos nacieron en 1999.*/

select count(*) as cantidad_alumnos from persona  where tipo = 'alumno' and year(fecha_nacimiento) = '1999';

/*3. Calcula cuántos profesores/as hay en cada departamento. El resultado sólo tiene que mostrar dos columnas, una con el nombre del departamento
	y otra con el número de profesores/as que hay en este departamento. El resultado solo debe incluir los departamentos que tienen profesores/as 
	asociados y deberá estar ordenado de mayor a menor por el número de profesores/as.*/
 
/*4. Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tenga en cuenta que pueden existir 
	departamentos que no tienen profesores/as asociados. Estos departamentos también deben aparecer en el listado.*/
/*5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta
	que pueden existir grados que no tienen asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado
	de mayor a menor por el número de asignaturas.*/
/*6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados 
	que tengan más de 40 asignaturas asociadas.*/
/*7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado 
	debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de este tipo.*/
/*8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá 
	mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.*/
/*9. Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten
	ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.*/


/*10. Devuelve todos los datos del alumno/a más joven.*/
		select * from persona where   tipo = 'alumno' and fecha_nacimiento = (select max(fecha_nacimiento) from persona);
     
/*11. Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.*/
		select  prof.id_profesor, per.nombre, per.apellido1 from profesor prof
        inner join persona per on prof.id_profesor = per.id
        left join asignatura asi on prof.id_profesor = asi.id_profesor
        where asi.id_profesor is null;
    
    
    