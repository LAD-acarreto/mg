# ========================================================================
# LAD-mg
# Medias generalizadas y comparabilidad intertemporal del ingreso real
# ENIGH 2020-2024
#
# Elaboración:
# Alberto Carreto Nieto
#
# Proyecto:
# LAD - Laboratorio de Análisis Distributivo
#
# Descripción:
# Este script calcula medias generalizadas para las bases de datos
# derivadas de la ENIGH 2020, 2022 y 2024 utilizando ingresos
# reexpresados en pesos constantes de agosto de 2022.
# ========================================================================

# ------------------------------------------------------------------------
# 0. LIMPIEZA DEL ENTORNO
# ------------------------------------------------------------------------
rm(list = ls())

# ------------------------------------------------------------------------
# 1. LIBRERÍAS
# ------------------------------------------------------------------------
required_packages <- c(
  "haven",
  "data.table"
)

for(pkg in required_packages){
  
  if(!require(pkg, character.only = TRUE)){

    install.packages(pkg)
    library(pkg, character.only = TRUE)
    
  }
  
}


# ------------------------------------------------------------------------
# 2. IMPORTACIÓN DE BASES DE DATOS
# ------------------------------------------------------------------------

# Ruta principal de trabajo
# Modifique la ruta según la ubicación local de los archivos
ruta_base <- "D:/Investigaciones/Comparación intertemporal/"

# Archivos de entrada
# Modifique los nombres de archivo si utiliza una estructura distinta
archivos <- list(
  
  "2020" = "pobreza_20_base_2022.dta",
  "2022" = "pobreza_22.dta",
  "2024" = "pobreza_24_base_2022.dta"
  
)

# Importar bases
bases <- lapply(archivos, function(x){
  
  as.data.table(
    read_dta(
      paste0(ruta_base, x)
    )
  )
  
})

# Asignar nombres
names(bases) <- names(archivos)

# ------------------------------------------------------------------------
# 2.1 VERIFICACIÓN DE VARIABLES
# ------------------------------------------------------------------------

cat("\nVariables disponibles por base:\n")

for(i in names(bases)){
  
  cat("\nBase", i, ":\n")
  
  print(
    names(bases[[i]])
  )
  
}


# ------------------------------------------------------------------------
# 3. FUNCIÓN DE MEDIA GENERALIZADA
# ------------------------------------------------------------------------
# Calcula la media generalizada para un vector de ingresos utilizando
# ponderadores muestrales y un parámetro alpha.
#
# alpha = 0  → media geométrica
# alpha = 1  → media aritmética
# alpha ≠ 0  → media generalizada
# ------------------------------------------------------------------------

mg_alpha <- function(y, weights, alpha){
  
  # Eliminar observaciones faltantes
  validos <- !is.na(y) & !is.na(weights)
  
  y <- y[validos]
  weights <- weights[validos]
  
  # Restricción necesaria para alpha <= 0
  if(alpha <= 0 && any(y <= 0)){
    
    stop(
      "Existen valores no positivos incompatibles con alpha <= 0."
    )
    
  }
  
  # Media geométrica
  if(alpha == 0){
    
    return(
      exp(
        weighted.mean(log(y), weights)
      )
    )
    
  }
  
  # Media generalizada
  return(
    
    weighted.mean(
      y^alpha,
      weights
    )^(1/alpha)
    
  )
  
}


# ------------------------------------------------------------------------
# 4. CÁLCULO DE MEDIAS GENERALIZADAS POR AÑO
# ------------------------------------------------------------------------
# Calcula medias generalizadas para una base de datos utilizando
# la variable de ingreso y el factor de expansión definidos.
# ------------------------------------------------------------------------

calcular_mg_año <- function(
    
  dt,
  año,
  
  variable_ingreso = "ictpc", # Modifique la variable de ingreso si es necesario
  variable_factor  = "factor",   # Modifique el factor de expansión si es necesario
  
  alphas = c(0, 1, 2) # Agregue los valores de alpha que considere necesarios
  
){
  
  # Extraer variables
  ingreso <- dt[[variable_ingreso]]
  factor  <- dt[[variable_factor]]
  
  # Restricción necesaria para alpha <= 0
  positivos <- !is.na(ingreso) &
    !is.na(factor)  &
    ingreso > 0
  
  ingreso <- ingreso[positivos]
  factor  <- factor[positivos]
  
  # Calcular medias generalizadas
  resultados <- data.table(
    periodo = año
  )
  
  # Incorporar resultados para cada alpha
  for(a in alphas){
    
    nombre_columna <- paste0(
      "alpha_",
      gsub("-", "m", as.character(a))
    )
    
    resultados[ ,
                (nombre_columna) := mg_alpha(
                  ingreso,
                  factor,
                  a
                )
    ]
    
  }
  
  return(resultados)
  
}

# ------------------------------------------------------------------------
# 4.1 APLICAR FUNCIÓN A TODAS LAS BASES
# ------------------------------------------------------------------------

resultados_final <- rbindlist(
  
  lapply(
    
    names(bases),
    
    function(año){
      
      calcular_mg_año(
        dt = bases[[año]],
        año = as.numeric(año)
      )
      
    }
    
  )
  
)

# ------------------------------------------------------------------------
# 5. FORMATO DE RESULTADOS
# ------------------------------------------------------------------------

resultados_formato <- copy(resultados_final)

columnas_mg <- names(resultados_formato)[-1]

resultados_formato[ ,
                    (columnas_mg) := lapply(
                      .SD,
                      function(x) round(x, 1)
                    ),
                    .SDcols = columnas_mg
]

print(resultados_formato)

# ------------------------------------------------------------------------
# 6. EXPORTAR RESULTADOS
# ------------------------------------------------------------------------

fwrite(
  resultados_formato,
  "medias_generalizadas_2020_2024.csv"
)

cat(
  "\nResultados exportados correctamente:\n",
  "medias_generalizadas_2020_2024.csv\n"
)


