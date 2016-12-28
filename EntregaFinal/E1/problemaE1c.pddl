(define (problem visual-content-problem)
  
  (:domain visual-content)

  (:objects
    Rocky1 Rocky2 Rocky3 
    ElSenorDeLosAnillos1 ElSenorDeLosAnillos2 ElSenorDeLosAnillos3
    HarryPotter1 HarryPotter2 HarryPotter3 HarryPotter4 HarryPotter5 HarryPotter6 HarryPotter7 HarryPotter8
    SpiritedAway - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 dia12 dia13 dia14 dia15 - dia
  )

  (:init
    (predecesor Rocky2 Rocky1)
    (predecesor Rocky3 Rocky2)

    (predecesor ElSenorDeLosAnillos2 ElSenorDeLosAnillos1)
    (predecesor ElSenorDeLosAnillos3 ElSenorDeLosAnillos2)

    (predecesor HarryPotter2 HarryPotter1)
    (predecesor HarryPotter3 HarryPotter2)
    (predecesor HarryPotter4 HarryPotter3)
    (predecesor HarryPotter5 HarryPotter4)
    (predecesor HarryPotter6 HarryPotter5)
    (predecesor HarryPotter7 HarryPotter6)
    (predecesor HarryPotter8 HarryPotter7)

    (quiereVer Rocky3)
    (quiereVer ElSenorDeLosAnillos3)
    (quiereVer SpiritedAway)
    (quiereVer HarryPotter8)
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
  ; En este test lo que nos tendría que planificar es lo siguiente:
  ; - Rocky3 y como consecuencia de ello, en días anteriores Rocky 2 y Rocky1.
  ; - SpiritedAway pues no tiene ninguna dependencia
  ; - Rambo2 y Rambo1 pues queremos ver la 2 y no hemos visto la 1.
)