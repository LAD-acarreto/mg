# mg

Herramienta para el análisis distributivo y la comparabilidad
intertemporal del ingreso mediante medias generalizadas y
deflactación consistente.

---

## Descripción

Este repositorio contiene scripts, funciones y bases de datos
utilizadas para el cálculo de medias generalizadas aplicadas
al análisis de la comparabilidad intertemporal del ingreso
real en México.

El repositorio incorpora procedimientos de deflactación
consistente orientados a establecer un numerario común entre
distintas ediciones de la Encuesta Nacional de Ingresos y
Gastos de los Hogares (ENIGH).

El diseño del script permite adaptar fácilmente los procedimientos
de cálculo a otras encuestas de hogares, siempre que exista una
variable monetaria de ingreso o gasto y un factor de expansión
compatibles con la estructura general de las funciones implementadas.

---

## Procedimiento

Se proponen dos procedimientos de reproducción. El primero
permite replicar directamente los resultados del artículo.
El segundo permite reconstruir los deflactores y modificar
el periodo de referencia utilizado para expresar los ingresos
en términos reales.

### Procedimiento A
Reproducción directa de los resultados del artículo.

1. Descargar las cinco bases de datos que comienzan con el
   nombre `pobreza` disponibles en la carpeta `Datos`.

2. Descargar el script `principal.R`, el cual reproduce
   las medias generalizadas para los años 2020, 2022 y 2024.

3. Abrir R y modificar en el script la ruta correspondiente
   a la carpeta que contiene las bases de datos descargadas.

4. Ejecutar el script utilizando las bases originales y
   exportar el archivo `medias_generalizadas_2020_2024.csv`
   con un nombre distintivo.

5. Ejecutar nuevamente el script utilizando las bases
   reexpresadas en pesos constantes de agosto de 2022 y
   exportar el archivo resultante con un nombre distinto.

---

### Procedimiento B
Reconstrucción de deflactores y modificación del periodo de referencia.

1. Descargar las cinco bases de datos y las 12 series del
   INPC disponibles en la carpeta `Datos`.

2. Abrir el archivo `.csv` o el `.IQY` que contiene las doce series y
   construir los doce deflactores con base en precios
   constantes de agosto de 2022 o en cualquier otro periodo
   de referencia requerido.

3. Sustituir los 16 deflactores contenidos en el programa
   de cálculo de pobreza multidimensional del INEGI/CONEVAL
   y ejecutar los programas para obtener las bases de datos
   denominadas `pobreza`.

   Los programas de cálculo oficiales se encuentran disponibles
   en los sitios web del INEGI y del CONEVAL junto con las
   bases originales correspondientes.

4. Abrir R y modificar en el script la ruta correspondiente
   a la carpeta que contiene las bases de datos descargadas.

5. Ejecutar el script utilizando las bases originales y
   exportar el archivo `medias_generalizadas_2020_2024.csv`
   con un nombre distintivo.

6. Ejecutar nuevamente el script utilizando las bases
   reexpresadas en pesos constantes de agosto de 2022 y
   exportar el archivo resultante con un nombre distinto.

---

## Estructura del repositorio

```plaintext
R/
 ├── principal.R
 ├── medias_generalizadas.R
 └── bootstrap.R

Datos/
```

## Bibliografía básica
- Deaton, A. y J. Muellbauer (1980).  
  *Economics and Consumer Behavior.* Cambridge University Press.
- Fisher, I. (1922).  
  *The Making of Index Numbers.* Houghton Mifflin.
- Foster, J. y M. Székely (2008).  
  *Is Economic Growth Good for the Poor?* Asian Development Review,
  25(1-2), 1-28.

## Autor
Alberto Carreto Nieto

---

Abril de 2026
