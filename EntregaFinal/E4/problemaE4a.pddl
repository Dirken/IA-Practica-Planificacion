(define (problem problemaE4a)
  
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

    ;; Peliculas

    (= (diaAsig django) 0)      (= (minutos django) 20)
    (= (diaAsig elOrfanato) 0)  (= (minutos elOrfanato) 20)
    (= (diaAsig jumanji) 0)     (= (minutos jumanji) 30)
    (= (diaAsig intocable) 0)   (= (minutos intocable) 60)

    (= (diaAsig ElSenorDeLosAnillos1) 0) (= (minutos ElSenorDeLosAnillos1) 160)
    (= (diaAsig ElSenorDeLosAnillos2) 0) (= (minutos ElSenorDeLosAnillos2) 170)
    (= (diaAsig ElSenorDeLosAnillos3) 0) (= (minutos ElSenorDeLosAnillos3) 140)

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