(define (problem problemaE4c)
  
  (:domain visual-content)

  (:objects
    breakingBad01 breakingBad02 breakingBad03 breakingBad04 breakingBad05 breakingBad06 breakingBad07 breakingBad08 breakingBad09 
    narcos1 narcos2 narcos3 narcos4 narcos5 narcos6
    Jumanji
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

    (= (diaAsig breakingBad01) 0) (= (minutos breakingBad01) 45)
    (= (diaAsig breakingBad02) 0) (= (minutos breakingBad02) 45)
    (= (diaAsig breakingBad03) 0) (= (minutos breakingBad03) 45)
    (= (diaAsig breakingBad04) 0) (= (minutos breakingBad04) 45)
    (= (diaAsig breakingBad05) 0) (= (minutos breakingBad05) 45)
    (= (diaAsig breakingBad06) 0) (= (minutos breakingBad06) 45)
    (= (diaAsig breakingBad07) 0) (= (minutos breakingBad07) 45)
    (= (diaAsig breakingBad08) 0) (= (minutos breakingBad08) 45)
    (= (diaAsig breakingBad09) 0) (= (minutos breakingBad09) 45)

    (predecesor breakingBad02 breakingBad01)            
    (predecesor breakingBad03 breakingBad02)
    (paralelo breakingBad04 breakingBad03)
    (predecesor breakingBad05 breakingBad04)
    (predecesor breakingBad06 breakingBad05)
    (predecesor breakingBad07 breakingBad06)
    (predecesor breakingBad08 breakingBad07)
    (predecesor breakingBad09 breakingBad08)

    (= (diaAsig narcos1) 0) (= (minutos narcos1) 32)
    (= (diaAsig narcos2) 0) (= (minutos narcos2) 32)
    (= (diaAsig narcos3) 0) (= (minutos narcos3) 32)
    (= (diaAsig narcos4) 0) (= (minutos narcos4) 32)
    (= (diaAsig narcos5) 0) (= (minutos narcos5) 32)
    (= (diaAsig narcos6) 0) (= (minutos narcos6) 32)

    (predecesor narcos2 narcos1)
    (predecesor narcos3 narcos2)
    (paralelo narcos4 narcos3)
    (predecesor narcos5 narcos4)
    (predecesor narcos6 narcos5)

    (= (diaAsig Jumanji) 0) (= (minutos Jumanji) 160)

    (= (diaAsig ElSenorDeLosAnillos1) 0) (= (minutos ElSenorDeLosAnillos1) 160)
    (= (diaAsig ElSenorDeLosAnillos2) 0) (= (minutos ElSenorDeLosAnillos2) 170)
    (= (diaAsig ElSenorDeLosAnillos3) 0) (= (minutos ElSenorDeLosAnillos3) 140)

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