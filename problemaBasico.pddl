;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Creation of basic problem
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; The format of a (simple) problem definition is:


; (define (problem PROBLEM_NAME)
;   (:domain DOMAIN_NAME)
;   (:objects OBJ1 OBJ2 ... OBJ_N)
;   (:init ATOM1 ATOM2 ... ATOM_N)
;   (:goal CONDITION_FORMULA)
;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem visualt-content-problem)
	
  (:domain visual-content)

  (:objects
    Rambo1 Rambo2 Rocky1 Rocky2 CastilloEnElCielo SpiritedAway - visual-content
  )

  (:init
    (predecesor Rambo2 Rambo1)
	(predecesor Rocky2 Rocky1)
    (visto CastilloEnElCielo)
    (visto Rocky1)
    (quiereVer Rambo2)
    (quiereVer SpiritedAway)
  	
  ) 

  (:goal 
  	(and
  		(yaPlanificado Rocky2)
	  	(yaPlanificado Rambo2)
	  	(yaPlanificado SpiritedAway)
	  	;(yaPlanificado Rocky1)
	  	)
  	)
  ; En este test lo que nos tendría que planificar es lo siguiente:
  ; - Rocky2 pues ya hemos visto Rocky1.
  ; - SpiritedAway pues no tiene ninguna dependencia
  ; - Rambo2 y Rambo1 pues queremos ver la 2 y no hemos visto la 1.
)