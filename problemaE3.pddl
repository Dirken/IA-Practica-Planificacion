(define (problem problemaE2)
  
  (:domain visual-content)

  (:objects
      lib1 lib2 lib3 lib4 lib5 lib6 lib7 lib8 lib9 lib10 lib11 lib12 lib13 lib14 - contenido
      dia12 dia11 dia10 dia9 dia8 dia7 dia6 dia5 dia4 dia3 dia2 dia1 - dia
  )

  (:init
    (= (numdia dia1) 1)(= (numdia dia2) 2)(= (numdia dia3) 3)(= (numdia dia4) 4)(= (numdia dia5) 5)(= (numdia dia6) 6)
    (= (numdia dia7) 7)(= (numdia dia8) 8)(= (numdia dia9) 9)(= (numdia dia10) 10)(= (numdia dia11) 11)(= (numdia dia12) 12)
    (= (diaAsig lib1) 0)(= (diaAsig lib2) 0)(= (diaAsig lib3) 0)(= (diaAsig lib4) 0)(= (diaAsig lib5) 0)(= (diaAsig lib6) 0)
    (= (diaAsig lib7) 0)(= (diaAsig lib8) 0)(= (diaAsig lib9) 0)(= (diaAsig lib10) 0)(= (diaAsig lib11) 0)(= (diaAsig lib12) 0)
    (= (diaAsig lib13) 0)(= (diaAsig lib14) 0)
    
    (quiereVer lib4)
    (predecesor lib4 lib3)
    (predecesor lib3 lib2)
    (predecesor lib2 lib1)
    (paralelo lib3 lib14)
    (paralelo lib4 lib13)
    (predecesor lib13 lib12)
    (predecesor lib14 lib13)
  ) 

  (:goal (forall (?lib - contenido) 
            (or 
              (not (quiereVer ?lib))
              (and
                (quiereVer ?lib)
                (yaPlanificado ?lib)
              )
            )
          )
  )
)