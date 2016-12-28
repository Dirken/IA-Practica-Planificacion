(define (problem problemaE2)
  
  (:domain visual-content)

  (:objects
    ElSenorDeLosAnillos1 ElSenorDeLosAnillos2 ElSenorDeLosAnillos3 - contenido
     dia1 dia2 - dia
  )

  (:init
    (= (numdia dia1) 1)
    (= (numdia dia2) 2)

    (= (diaAsig ElSenorDeLosAnillos1) 0)
    (= (diaAsig ElSenorDeLosAnillos2) 0)
    (= (diaAsig ElSenorDeLosAnillos3) 0)
    

    (paralelo ElSenorDeLosAnillos2 ElSenorDeLosAnillos1)
    (predecesor ElSenorDeLosAnillos3 ElSenorDeLosAnillos2)

    (quiereVer ElSenorDeLosAnillos3)
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