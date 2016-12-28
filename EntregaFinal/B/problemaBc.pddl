(define (problem visual-content-problem)
	
  (:domain visual-content)

  (:objects
    Rambo1 Rambo2 
    Rocky1 Rocky2 
    ElSenorDeLosAnillos1 ElSenorDeLosAnillos2
    Doraemon1 Doraemon2
    ShinChan1 ShinChan2
    KillBill1 KillBill2
     - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 dia12 - dia
  )

  (:init
    (predecesor Rambo2 Rambo1)
	  (predecesor Rocky2 Rocky1)
    (predecesor ElSenorDeLosAnillos2 ElSenorDeLosAnillos1)
    (predecesor Doraemon2 Doraemon1)
    (predecesor ShinChan2 ShinChan1)
    (predecesor KillBill2 KillBill1)

    (quiereVer Rambo2)
    (quiereVer Rocky2)
    (quiereVer ElSenorDeLosAnillos2)
    (quiereVer Doraemon2)
    (quiereVer ShinChan2)
    (quiereVer KillBill2)
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