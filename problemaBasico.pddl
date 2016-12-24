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
    Rambo1 Rambo2 Rocky1 Rocky2 Rocky3 CastilloEnElCielo SpiritedAway - visual-content
  )

  (:init
    (predecesor Rambo1 Rambo2)
    (visto CastilloEnElCielo)
    (visto Rocky1)
    (quiereVer  Rambo2)
    (quiereVer Rocky3)
    (quiereVer SpiritedAway)
  	
  ) 

  (:goal (and
  	(yaPlanificado Rocky3)
  	(yaPlanificado Rambo2)
  	(yaPlanificado SpiritedAway)
  	)
  )
)