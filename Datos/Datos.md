## Datos

Las bases de datos de la ENIGH y las 12 series del Índice Nacional de Precios al Consumidor (INPC) utilizadas para la construcción de los deflactores contenidos en el programa de cálculo de la pobreza multidimensional (PM) del INEGI/CONEVAL se encuentran disponibles en dos carpetas de Google Drive.

### Bases de datos del programa de cálculo de la PM

Las bases de datos obtenidas a partir de la ENIGH mediante el programa oficial de cálculo de pobreza multidimensional conservan la denominación `pobreza`, siguiendo la nomenclatura utilizada por dicho programa. En el caso de la ENIGH 2020 y 2024, los ingresos fueron reexpresados en pesos constantes de agosto de 2022 mediante un procedimiento de deflactación orientado a establecer un numerario común consistente entre distintas ediciones de la encuesta. 

Para aquellas personas que desean reproducir los datos desde cero deben descargar los programas de cálculo del CONEVAL para los años 2020 y 2022 y el del INEGI para 2024. Después, se deben calcular los deflactores con base agosto de 2022 utilizando las doce series del INPC disponibles en esta misma página y sustituirlos en los programas correspondientes de 2020 y 2024. Posteriormente, se ejecutan los programas que generan los archivos denominados `pobreza` y sus respectivas extensiones.

La carpeta contiene cinco bases de datos en formato `.dta`:
- pobreza 2020 original
- pobreza 2022 original
- pobreza 2024 original
- pobreza 2020 reexpresada en pesos constantes de agosto de 2022
- pobreza 2024 reexpresada en pesos constantes de agosto de 2022

🔗 https://drive.google.com/drive/folders/1KG0dEKKYhSlDn37GeKSka-h0HhwcwZji?usp=sharing

### Series del INPC
Las doce series del INPC utilizadas en la construcción de los 16 deflactores asociados al procedimiento de pobreza multidimensional del INEGI/CONEVAL se encuentran disponibles en formato IQY o csv. En el caso del archivo `.IQY`, este corresponde a la consulta estructurada empleada para recuperar las series desde el portal del INEGI mediante Microsoft Excel, mientras que el archivo `.csv` contiene una versión consolidada de las series descargadas.

Esta carpeta  incluye:
- `inpc_12_series.csv`
- `inpc_12_series.IQY`

🔗 https://drive.google.com/drive/folders/11h09ARkm-spFPbuqS0GyvrO74gaN-pXh?usp=drive_link

### Notas
- Estas bases corresponden a una transformación analítica de los microdatos originales.
- No constituyen publicaciones oficiales del INEGI.

**Fuente:** Elaboración propia a partir de información de la ENIGH y del INPC.

Para reproducir los resultados, utilice los scripts incluidos en este repositorio en conjunto con los datos disponibles en el enlace anterior.
