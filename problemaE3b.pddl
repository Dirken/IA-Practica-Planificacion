(define (problem problemaE3b)
  
  (:domain visual-content)

  (:objects
    breakingBad1 breakingBad2 breakingBad3 breakingBad4 breakingBad5 breakingBad6 breakingBad7 breakingBad8 breakingBad9 breakingBad10 breakingBad11 breakingBad12
    narcos1 narcos2 narcos3 narcos4 narcos5 narcos6
    loQueElVientoSeLlevo - contenido
    dia17 dia16 dia15 dia14 dia13 dia12 dia11 dia10 dia09 dia08 dia07 dia06 dia05 dia04 dia03 dia02 dia01 - dia 
    dia01Asigs dia02Asigs dia03Asigs dia04Asigs dia05Asigs dia06Asigs dia07Asigs dia08Asigs dia09Asigs dia10Asigs dia11Asigs dia12Asigs dia13Asigs dia14Asigs dia15Asigs dia16Asigs dia17Asigs - asignaciones 
  )


  (:init
    (= (numdia dia01) 01)   (= (numAsig dia01Asigs) 0)
    (= (numdia dia02) 02)   (= (numAsig dia02Asigs) 0)
    (= (numdia dia03) 03)   (= (numAsig dia03Asigs) 0)
    (= (numdia dia04) 04)   (= (numAsig dia04Asigs) 0)
    (= (numdia dia05) 05)   (= (numAsig dia05Asigs) 0)
    (= (numdia dia06) 06)   (= (numAsig dia06Asigs) 0)
    (= (numdia dia07) 07)   (= (numAsig dia07Asigs) 0)
    (= (numdia dia08) 08)   (= (numAsig dia08Asigs) 0)
    (= (numdia dia09) 09)   (= (numAsig dia09Asigs) 0)
    (= (numdia dia10) 10)   (= (numAsig dia10Asigs) 0)
    (= (numdia dia11) 11)   (= (numAsig dia11Asigs) 0)
    (= (numdia dia12) 12)   (= (numAsig dia12Asigs) 0)
    (= (numdia dia13) 13)   (= (numAsig dia13Asigs) 0)
    (= (numdia dia14) 14)   (= (numAsig dia14Asigs) 0)
    (= (numdia dia15) 15)   (= (numAsig dia15Asigs) 0)
    (= (numdia dia16) 16)   (= (numAsig dia16Asigs) 0)
    (= (numdia dia17) 17)   (= (numAsig dia17Asigs) 0)
  
    ;; Breaking Bad

    (= (diaAsig breakingBad1) 0)
    (= (diaAsig breakingBad2) 0)
    (= (diaAsig breakingBad3) 0)
    (= (diaAsig breakingBad4) 0)
    (= (diaAsig breakingBad5) 0)
    (= (diaAsig breakingBad6) 0)
    (= (diaAsig breakingBad7) 0)
    (= (diaAsig breakingBad8) 0)
    (= (diaAsig breakingBad9) 0)
    (= (diaAsig breakingBad10) 0)
    (= (diaAsig breakingBad11) 0)
    (= (diaAsig breakingBad12) 0)

    (predecesor breakingBad2 breakingBad1)
    (predecesor breakingBad3 breakingBad2)
    (predecesor breakingBad4 breakingBad3)
    (predecesor breakingBad5 breakingBad4)
    (predecesor breakingBad6 breakingBad5)
    (predecesor breakingBad7 breakingBad6)
    (predecesor breakingBad8 breakingBad7)
    (predecesor breakingBad9 breakingBad8)    
    (predecesor breakingBad10 breakingBad9) 
    (predecesor breakingBad11 breakingBad10)
    (predecesor breakingBad12 breakingBad11)

    (paralelo breakingBad3 breakingBad4)
    (paralelo breakingBad8 breakingBad9)

    ;; Lo que el viento se llevó

    (= (diaAsig loQueElVientoSeLlevo) 0)

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

    ;; Que quiere ver

    (quiereVer breakingBad3)  
    (quiereVer breakingBad12)
    (quiereVer breakingBad7)
    (quiereVer loQueElVientoSeLlevo)
    ;;(quiereVer narcos1)
    (quiereVer narcos6)

  ) 

  (:goal (forall (?cont - contenido) 
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