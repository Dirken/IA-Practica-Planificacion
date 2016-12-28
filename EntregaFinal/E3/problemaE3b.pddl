(define (problem problemaE3b)
  
  (:domain visual-content)

  (:objects
    breakingBad01 breakingBad02 breakingBad03
    narcos1 narcos2 narcos3
    pokemon1 pokemon2 pokemon3
    juegoDeTronos1 juegoDeTronos2 juegoDeTronos3
     - contenido
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
  
    ;; Breaking Bad

    (= (diaAsig breakingBad01) 0)
    (= (diaAsig breakingBad02) 0)
    (= (diaAsig breakingBad03) 0)

    (predecesor breakingBad02 breakingBad01)
    (predecesor breakingBad03 breakingBad02)

    (= (diaAsig narcos1) 0)
    (= (diaAsig narcos2) 0)
    (= (diaAsig narcos3) 0)

    (predecesor narcos2 narcos1)
    (predecesor narcos3 narcos2)

    (= (diaAsig pokemon1) 0)
    (= (diaAsig pokemon2) 0)
    (= (diaAsig pokemon3) 0)

    (predecesor pokemon2 pokemon1)
    (predecesor pokemon3 pokemon2)

    (= (diaAsig juegoDeTronos1) 0)
    (= (diaAsig juegoDeTronos2) 0)
    (= (diaAsig juegoDeTronos3) 0)

    (predecesor juegoDeTronos2 juegoDeTronos1)
    (predecesor juegoDeTronos3 juegoDeTronos2)

    ;; Que quiere ver
    (quiereVer breakingBad03)
    (quiereVer narcos3)
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