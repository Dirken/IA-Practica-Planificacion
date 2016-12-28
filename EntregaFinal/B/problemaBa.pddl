(define (problem visual-content-problem)
	
  (:domain visual-content)

  (:objects
    Rambo1 Rambo2
    SpiritedAway - contenido
    dia1 dia2 dia3 dia4 dia5 - dia
  )

  (:init
    (predecesor Rambo2 Rambo1)

    (quiereVer Rambo2)
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