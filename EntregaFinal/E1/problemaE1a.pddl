(define (problem visual-content-problem)
	
  (:domain visual-content)

  (:objects
    Rocky1 Rocky2 Rocky3 
    SpiritedAway - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 - dia
  )

  (:init
	  (predecesor Rocky2 Rocky1)
    (predecesor Rocky3 Rocky2)

    (quiereVer Rocky3)
    (quiereVer SpiritedAway)
  ) 

  (:goal 
    (forall (?content - contenido) 
      (or 
        (not (quiereVer ?content))
        (and
          (quiereVer ?content)
          (yaPlanificado ?content)
        )
      )
    )
  )
)