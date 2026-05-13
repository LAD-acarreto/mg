## Datos

Las bases de datos de la ENIGH y las 12 series del Índice Nacional de Precios al Consumidor (INPC) utilizadas para la construcción de los deflactores contenidos en el programa de cálculo de la pobreza multidimensional (PM) del INEGI/CONEVAL se encuentran disponibles en carpetas de Google Drive.

### Bases de datos de la ENIGH

La carpeta contiene cinco bases de datos en formato `.dta`:

- ENIGH 2020 original
- ENIGH 2022 original
- ENIGH 2024 original
- ENIGH 2020 reexpresada en pesos constantes de agosto de 2022
- ENIGH 2024 reexpresada en pesos constantes de agosto de 2022

🔗 https://drive.google.com/drive/folders/1KG0dEKKYhSlDn37GeKSka-h0HhwcwZji?usp=sharing

Estas bases derivan de la Encuesta Nacional de Ingresos y Gastos de los Hogares (ENIGH) del INEGI y fueron utilizadas para el cálculo de medias generalizadas en el análisis de la comparabilidad intertemporal del ingreso.

Los ingresos fueron reexpresados en pesos constantes de agosto de 2022 mediante un procedimiento de deflactación orientado a establecer un numerario común consistente entre distintas ediciones de la encuesta.

### Series del INPC

La carpeta también incluye:

- `inpc_12_series.csv`
- `inpc_12_series.IQY`

Estos archivos contienen las 12 series del INPC utilizadas en la construcción de los deflactores asociados al procedimiento de pobreza multidimensional del INEGI/CONEVAL.
El archivo `.IQY` corresponde a la consulta estructurada empleada para recuperar las series desde el portal del INEGI mediante Microsoft Excel, mientras que el archivo `.csv` contiene una versión consolidada de las series descargadas.

https://drive.google.com/drive/folders/11h09ARkm-spFPbuqS0GyvrO74gaN-pXh?usp=drive_link

### Notas
- Estas bases corresponden a una transformación analítica de los microdatos originales.
- No constituyen publicaciones oficiales del INEGI.

**Fuente:** INEGI, Encuesta Nacional de Ingresos y Gastos de los Hogares (ENIGH).

Para reproducir los resultados, utilice los scripts incluidos en este repositorio en conjunto con los datos disponibles en el enlace anterior.
