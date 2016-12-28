(define (problem problemaE4b)
  
  (:domain visual-content)

  (:objects
    breakingBad01 breakingBad02 breakingBad03
    narcos1 narcos2 narcos3
    pokemon1 pokemon2 pokemon3
    juegoDeTronos1 juegoDeTronos2 juegoDeTronos3
    ElSenorDeLosAnillos1 ElSenorDeLosAnillos2 ElSenorDeLosAnillos3 - contenido
    dia01 dia02 dia03 dia04 dia05 dia06 dia07 dia08 dia09 dia10 dia11 - dia 
  )


  (:init
    (= (numdia dia01) 01)   (= (minutosOcupados dia01) 0)
    (= (numdia dia02) 02)   (= (minutosOcupados dia02) 0)
    (= (numdia dia03) 03)   (= (minutosOcupados dia03) 0)
    (= (numdia dia04) 04)   (= (minutosOcupados dia04) 0)
    (= (numdia dia05) 05)   (= (minutosOcupados dia05) 0)
    (= (numdia dia06) 06)   (= (minutosOcupados dia06) 0)
    (= (numdia dia07) 07)   (= (minutosOcupados dia07) 0)
    (= (numdia dia08) 08)   (= (minutosOcupados dia08) 0)
    (= (numdia dia09) 09)   (= (minutosOcupados dia09) 0)
    (= (numdia dia10) 10)   (= (minutosOcupados dia10) 0)
    (= (numdia dia11) 11)   (= (minutosOcupados dia11) 0)
  
    ;; Breaking Bad

    (= (diaAsig breakingBad01) 0) (= (minutos breakingBad01) 45)
    (= (diaAsig breakingBad02) 0) (= (minutos breakingBad02) 45)
    (= (diaAsig breakingBad03) 0) (= (minutos breakingBad03) 45)

    (predecesor breakingBad02 breakingBad01)
    (predecesor breakingBad03 breakingBad02)

    (= (diaAsig narcos1) 0) (= (minutos narcos1) 32)
    (= (diaAsig narcos2) 0) (= (minutos narcos2) 32)
    (= (diaAsig narcos3) 0) (= (minutos narcos3) 32)

    (predecesor narcos2 narcos1)
    (predecesor narcos3 narcos2)

    (= (diaAsig ElSenorDeLosAnillos1) 0) (= (minutos ElSenorDeLosAnillos1) 160)
    (= (diaAsig ElSenorDeLosAnillos2) 0) (= (minutos ElSenorDeLosAnillos2) 170)
    (= (diaAsig ElSenorDeLosAnillos3) 0) (= (minutos ElSenorDeLosAnillos3) 140)

    (predecesor ElSenorDeLosAnillos2 ElSenorDeLosAnillos1)
    (predecesor ElSenorDeLosAnillos3 ElSenorDeLosAnillos2)

    (= (diaAsig pokemon1) 0) (= (minutos pokemon1) 22)
    (= (diaAsig pokemon2) 0) (= (minutos pokemon2) 22)
    (= (diaAsig pokemon3) 0) (= (minutos pokemon3) 22)

    (predecesor pokemon2 pokemon1)
    (predecesor pokemon3 pokemon2)

    (= (diaAsig juegoDeTronos1) 0) (= (minutos juegoDeTronos1) 50)
    (= (diaAsig juegoDeTronos2) 0) (= (minutos juegoDeTronos2) 50)
    (= (diaAsig juegoDeTronos3) 0) (= (minutos juegoDeTronos3) 50)


    (predecesor juegoDeTronos2 juegoDeTronos1)
    (predecesor juegoDeTronos3 juegoDeTronos2)

    ;; Que quiere ver
    (quiereVer breakingBad03)
    (quiereVer narcos3)
    (quiereVer ElSenorDeLosAnillos3)
    (quiereVer pokemon3)
    (quiereVer juegoDeTronos3)
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