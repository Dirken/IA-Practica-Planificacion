(define (problem visual-content-problem)
	
  (:domain visual-content)

  (:objects
    Rambo1 Rambo2 
    Rocky1 Rocky2 
    CastilloEnElCielo 
    SpiritedAway - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 - dia
  )

  (:init
    (predecesor Rambo2 Rambo1)
	  (predecesor Rocky2 Rocky1)

    (quiereVer Rambo2)
    (quiereVer Rocky2)
    (quiereVer CastilloEnElCielo)
    (quiereVer SpiritedAway)
  ) 

  (:goal (forall (?content - contenido) 
    (or 
      (not (quiereVer ?content))
      (and
        (quiereVer ?content)
        (yaPlanificado ?content)
      )
    )
  )
  )
  ; En este test lo que nos tendría que planificar es lo siguiente:
  ; - Rocky2 pues ya hemos visto Rocky1.
  ; - SpiritedAway pues no tiene ninguna dependencia
  ; - Rambo2 y Rambo1 pues queremos ver la 2 y no hemos visto la 1.
)