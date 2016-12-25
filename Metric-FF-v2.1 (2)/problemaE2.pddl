;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Creation of Basic + Extension1 problem
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (problem visual-content-problem)
	
  (:domain visual-content)

  (:objects
    Rambo1 Rambo2 Rocky1 Rocky2 Rocky3 CastilloEnElCielo SpiritedAway - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 - dia
  )

  (:init
    (predecesor Rambo2 Rambo1)
	  (predecesor Rocky2 Rocky1)
    (predecesor Rocky3 Rocky2)
    (visto CastilloEnElCielo)
    (quiereVer Rambo2)
    (quiereVer SpiritedAway)
  	
  ) 

  (:goal 
  	(and
  		(yaPlanificado Rocky3)
	  	(yaPlanificado Rambo2)
	  	(yaPlanificado SpiritedAway)
  	)
  )
  ; En este test lo que nos tendría que planificar es lo siguiente:
  ; - Rocky3 y como consecuencia de ello, en días anteriores Rocky 2 y Rocky1.
  ; - SpiritedAway pues no tiene ninguna dependencia
  ; - Rambo2 y Rambo1 pues queremos ver la 2 y no hemos visto la 1.
)