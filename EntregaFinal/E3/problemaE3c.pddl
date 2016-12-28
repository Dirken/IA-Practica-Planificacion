(define (problem problemaE3b)
  
  (:domain visual-content)

  (:objects
    breakingBad01 breakingBad02 breakingBad03 breakingBad04 breakingBad05 breakingBad06 breakingBad07 breakingBad08 breakingBad09 
    narcos1 narcos2 narcos3 narcos4 narcos5 narcos6
    Jumanji
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
  
    ;; Breaking Bad

    (= (diaAsig breakingBad01) 0)
    (= (diaAsig breakingBad02) 0)
    (= (diaAsig breakingBad03) 0)
    (= (diaAsig breakingBad04) 0)
    (= (diaAsig breakingBad05) 0)
    (= (diaAsig breakingBad06) 0)
    (= (diaAsig breakingBad07) 0)
    (= (diaAsig breakingBad08) 0)
    (= (diaAsig breakingBad09) 0)

    (predecesor breakingBad02 breakingBad01)            
    (predecesor breakingBad03 breakingBad02)
    (paralelo breakingBad04 breakingBad03)
    (predecesor breakingBad05 breakingBad04)
    (predecesor breakingBad06 breakingBad05)
    (predecesor breakingBad07 breakingBad06)
    (predecesor breakingBad08 breakingBad07)
    (predecesor breakingBad09 breakingBad08)

    ;; Narcos

    (= (diaAsig narcos1) 0)
    (= (diaAsig narcos2) 0)
    (= (diaAsig narcos3) 0)
    (= (diaAsig narcos4) 0)
    (= (diaAsig narcos5) 0)
    (= (diaAsig narcos6) 0)

    (predecesor narcos2 narcos1)
    (predecesor narcos3 narcos2)
    (predecesor narcos4 narcos3)
    (predecesor narcos5 narcos4)
    (predecesor narcos6 narcos5)

    ;; Peliculas

    (= (diaAsig Jumanji) 0)

    (= (diaAsig ElSenorDeLosAnillos1) 0)
    (= (diaAsig ElSenorDeLosAnillos2) 0)
    (= (diaAsig ElSenorDeLosAnillos3) 0)

    (predecesor ElSenorDeLosAnillos2 ElSenorDeLosAnillos1)
    (predecesor ElSenorDeLosAnillos3 ElSenorDeLosAnillos2)

    ;; Que quiere ver
 
    (quiereVer breakingBad09)
    (quiereVer narcos6)
    (quiereVer Jumanji)
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