(define (problem problemaE3b)
  
  (:domain visual-content)

  (:objects
    django
    elOrfanato
    jumanji
    intocable
    ElSenorDeLosAnillos1 ElSenorDeLosAnillos2 ElSenorDeLosAnillos3 - contenido
    dia01 dia02 dia03 dia04 dia05 dia06 dia07 dia08 dia09 dia10 dia11 - dia 
  )


  (:init
    (= (numdia dia01) 01)   (= (numAsig dia01) 0)
    (= (numdia dia02) 02)   (= (numAsig dia02) 0)
    (= (numdia dia03) 03)   (= (numAsig dia03) 0)
    (= (numdia dia04) 04)   (= (numAsig dia04) 0)
    (= (numdia dia05) 05)   (= (numAsig dia05) 0)
    (= (numdia dia06) 06)   (= (numAsig dia06) 0)
    (= (numdia dia07) 07)   (= (numAsig dia07) 0)
    (= (numdia dia08) 08)   (= (numAsig dia08) 0)
    (= (numdia dia09) 09)   (= (numAsig dia09) 0)
    (= (numdia dia10) 10)   (= (numAsig dia10) 0)
    (= (numdia dia11) 11)   (= (numAsig dia11) 0)

    (= (diaAsig django) 0)
    (= (diaAsig elOrfanato) 0)
    (= (diaAsig jumanji) 0)
    (= (diaAsig intocable) 0)

    (= (diaAsig ElSenorDeLosAnillos1) 0)
    (= (diaAsig ElSenorDeLosAnillos2) 0)
    (= (diaAsig ElSenorDeLosAnillos3) 0)

    (predecesor ElSenorDeLosAnillos2 ElSenorDeLosAnillos1)
    (predecesor ElSenorDeLosAnillos3 ElSenorDeLosAnillos2)

    ;; Que quiere ver
 
    (quiereVer django)
    (quiereVer elOrfanato)
    (quiereVer jumanji)
    (quiereVer intocable)
    (quiereVer ElSenorDeLosAnillos3)
  ) 

  (:goal 
    (forall (?cont - contenido) 
      (or 
        (not (quiereVer ?cont))
        (and
          (quiereVer ?cont)
          (yaPlanificado ?cont)
        )
      )
    ) 
  )
)