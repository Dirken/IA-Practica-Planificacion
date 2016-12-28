(define (problem problemaE2)
  
  (:domain visual-content)

  (:objects
    HarryPotter1 HarryPotter2 HarryPotter3 HarryPotter4 HarryPotter5 HarryPotter6 HarryPotter7 HarryPotter8
    - contenido
    dia1 dia2 dia3 dia4 - dia
  )

  (:init
    (= (numdia dia1) 1)
    (= (numdia dia2) 2)
    (= (numdia dia3) 3)
    (= (numdia dia4) 4)

    (= (diaAsig HarryPotter1) 0)
    (= (diaAsig HarryPotter2) 0)
    (= (diaAsig HarryPotter3) 0)
    (= (diaAsig HarryPotter4) 0)
    (= (diaAsig HarryPotter5) 0)
    (= (diaAsig HarryPotter6) 0)
    (= (diaAsig HarryPotter7) 0)
    (= (diaAsig HarryPotter8) 0)

    (predecesor HarryPotter2 HarryPotter1)
    (paralelo   HarryPotter3 HarryPotter2)
    (predecesor HarryPotter4 HarryPotter3)
    (predecesor HarryPotter5 HarryPotter4)
    (paralelo   HarryPotter6 HarryPotter5)
    (predecesor HarryPotter7 HarryPotter6)
    (predecesor HarryPotter8 HarryPotter7)

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
)