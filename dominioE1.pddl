;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Nivel básico + Extensión1 de dominio de nuestro problema
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Extensión 1: Los contenidos pueden tener de 0 a N predecesores pero ningún paralelo. El
; planificador es capaz de construir un plan para poder llegar a ver los contenidos objetivo,
; donde para todo contenido que pertenece al plan, todos sus contenidos predecesores pertenecen
; al plan y estan en días anteriores.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain visual-content)

	(:requirements :strips :typing :adl :equality)
	(:types contenido)
	(:types dia)

	(:predicates 
		
		(predecesor ?content - contenido ?pred - contenido)
		(visto  ?content - contenido)
		(quiereVer ?content - contenido)
		(yaPlanificado ?content - contenido)
		(diaOcupado ?d - dia)

	)

	(:action planning
	  :parameters 
		  (?content - contenido
		  ?d - dia)
	  :precondition 
	  (and 
	  	(not (diaOcupado ?d))
	  	(not (visto ?content)) ;es un contenido que no hemos visto,
	  	(not (yaPlanificado ?content)) ;es un contenido que no tenemos planificado,
	  	;si forma parte de este conjunto de conjunto, nos interesa:
	  	(forall (?c - contenido) 
	  		(or
	  		;Tiene un predecesor y lo ha visto o lo hemos planificado
		  		(and 
		  			(predecesor ?content ?c)
		  			(or
		  				(visto ?c)
		  				(yaPlanificado ?c)
		  			)
		  		)
		  		;No tiene ningun predecesor
		  		(not (predecesor ?content ?c))
		  		;Predecesor de un contenido que queremos ver.
		  		(and 
		  			(predecesor ?c ?content)
		  			(quiereVer ?c)
		  		)
	  		)
	  	)
	  )
	  :effect 
	  	(and 
	  		(diaOcupado ?d)
	  		(yaPlanificado ?content)
	  	)
	)
)