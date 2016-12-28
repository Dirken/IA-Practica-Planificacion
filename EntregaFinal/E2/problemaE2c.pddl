(define (problem problemaE2)
  
  (:domain visual-content)

  (:objects
    ElSenorDeLosAnillos1 ElSenorDeLosAnillos2 ElSenorDeLosAnillos3
    HarryPotter1 HarryPotter2 HarryPotter3 HarryPotter4 HarryPotter5 HarryPotter6 HarryPotter7 HarryPotter8
    KillBill1 KillBill2
    - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 - dia
  )

  (:init
    (= (numdia dia1) 1)
    (= (numdia dia2) 2)
    (= (numdia dia3) 3)
    (= (numdia dia4) 4)
    (= (numdia dia5) 5)
    (= (numdia dia6) 6)
    (= (numdia dia7) 7)
    (= (numdia dia8) 8)
    (= (numdia dia9) 9)
    (= (numdia dia10) 10)
    (= (numdia dia11) 11)

    (= (diaAsig ElSenorDeLosAnillos1) 0)
    (= (diaAsig ElSenorDeLosAnillos2) 0)
    (= (diaAsig ElSenorDeLosAnillos3) 0)

    (= (diaAsig HarryPotter1) 0)
    (= (diaAsig HarryPotter2) 0)
    (= (diaAsig HarryPotter3) 0)
    (= (diaAsig HarryPotter4) 0)
    (= (diaAsig HarryPotter5) 0)
    (= (diaAsig HarryPotter6) 0)
    (= (diaAsig HarryPotter7) 0)
    (= (diaAsig HarryPotter8) 0)

    (= (diaAsig KillBill1) 0)
    (= (diaAsig KillBill2) 0)

    (paralelo ElSenorDeLosAnillos2 ElSenorDeLosAnillos1)
    (predecesor ElSenorDeLosAnillos3 ElSenorDeLosAnillos2)

    (predecesor HarryPotter2 HarryPotter1)
    (paralelo   HarryPotter3 HarryPotter2)
    (predecesor HarryPotter4 HarryPotter3)
    (predecesor HarryPotter5 HarryPotter4)
    (paralelo   HarryPotter6 HarryPotter5)
    (predecesor HarryPotter7 HarryPotter6)
    (predecesor HarryPotter8 HarryPotter7)

    (predecesor KillBill2 KillBill1)

    (quiereVer ElSenorDeLosAnillos3)
    (quiereVer HarryPotter8)
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