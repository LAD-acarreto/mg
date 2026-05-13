# ------------------------------------------------------------------------
# FUNCIÓN DE MEDIA GENERALIZADA
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
# CÁLCULO DE MEDIAS GENERALIZADAS POR AÑO
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
# APLICAR FUNCIÓN A TODAS LAS BASES
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
