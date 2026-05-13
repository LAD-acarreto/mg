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

## Estructura del repositorio

```plaintext
R/
 ├── principal.R
 ├── medias_generalizadas.R
 └── bootstrap.R

Datos/
```

## Autor
Alberto Carreto Nieto
Abril de 2026
