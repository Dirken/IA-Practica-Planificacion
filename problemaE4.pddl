;Comprobar si consigue assignar teniendo en cuenta los libros leidos
(define (problem test4)
  
  (:domain visual-content)

  (:objects
      lib1 lib2 lib3 lib4 lib5 lib6 lib7 lib8 lib9 lib10 lib11 lib12 lib13 lib14 - content
      dia12 dia11 dia10 dia9 dia8 dia7 dia6 dia5 dia4 dia3 dia2 dia1 - dia
  )

  (:init
    (= (numdia dia1) 1)(= (numdia dia2) 2)(= (numdia dia3) 3)(= (numdia dia4) 4)(= (numdia dia5) 5)(= (numdia dia6) 6)
    (= (numdia dia7) 7)(= (numdia dia8) 8)(= (numdia dia9) 9)(= (numdia dia10) 10)(= (numdia dia11) 11)(= (numdia dia12) 12)
    (= (minutosOcupados dia1) 0)(= (minutosOcupados dia2) 0)(= (minutosOcupados dia3) 0)(= (minutosOcupados dia4) 0)(= (minutosOcupados dia5) 0)(= (minutosOcupados dia6) 0)
    (= (minutosOcupados dia7) 0)(= (minutosOcupados dia8) 0)(= (minutosOcupados dia9) 0)(= (minutosOcupados dia10) 0)(= (minutosOcupados dia11) 0)(= (minutosOcupados dia12) 0)
    (= (diaAsig lib1) 0)(= (diaAsig lib2) 0)(= (diaAsig lib3) 0)(= (diaAsig lib4) 0)(= (diaAsig lib5) 0)(= (diaAsig lib6) 0)
    (= (diaAsig lib7) 0)(= (diaAsig lib8) 0)(= (diaAsig lib9) 0)(= (diaAsig lib10) 0)(= (diaAsig lib11) 0)(= (diaAsig lib12) 0)
    (= (diaAsig lib13) 0)(= (diaAsig lib14) 0)
    (= (minutos lib1) 20)(= (minutos lib2) 20)(= (minutos lib3) 50)(= (minutos lib4) 10)(= (minutos lib5) 50)(= (minutos lib6) 150)
    (= (minutos lib7) 20)(= (minutos lib8) 30)(= (minutos lib9) 40)(= (minutos lib10) 50)(= (minutos lib11) 10)(= (minutos lib12) 20)
    (= (minutos lib13) 30)(= (minutos lib14) 40)
    (quiereVer lib3)
    (quiereVer lib2)
    (quiereVer lib7)
    (predecesor lib2 lib4)
    (predecesor lib4 lib3)
;;    (paralelo lib7 lib4)
;;    (libroleido lib6)
  ) 

  (:goal (forall (?lib - libro) 
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