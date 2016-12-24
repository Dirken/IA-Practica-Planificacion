;Nivel básico de dominio de nuestro problema
;Nivel básico: En el plan de visionado todos los contenidos tienen 0 o 1 predecesores 
;y ningún paralelo. El planiﬁcador es capaz de encontrar un plan para poder llegar a 
;ver los contenidos objetivo encadenando contenidos, donde cada contenido tiene solo
;uno o ningún predecesor. 

(define (domain visual-content)

; Because PDDL is a very general language and most planners support only a subset,
;  domains may declare requirements. The most commonly used requirements are:
; :strips
; The most basic subset of PDDL, consisting of STRIPS only.
; :equality
; This requirement means that the domain uses the predicate =, interpreted as equality.
; :typing
; This requirement means that the domain uses types (see Typing below).
; :adl
; Means that the domain uses some or all of ADL 
; (i.e. disjunctions and quantifiers in preconditions and goals, quantified and conditional effects).

	(:requirements :strips :typing :adl :equality)

;No hay necesidad de diferenciar entre películas y series (imho).
	(:types contenido)

;los contenidos del catálogo los contenidos predecesores a un contenido
;los contenidos paralelos a un contenido ---> En este nivel no.
;los contenidos que el usuario ya ha visto
;los contenidos que el usuario quiere ver

	(:predicates 
		
		(predecesor ?content - visual-content)
		(visto  ?content - visual-content)
		(quiereVer ?content - visual-content)
;Puede que ya lo hagamos planificado, se tendría que considerar.
		(planificado ?content - visual-content)




	)

	(:action planning
	  :parameters (?content - object)
	  :precondition (and ())
	  :effect (and ())))


)