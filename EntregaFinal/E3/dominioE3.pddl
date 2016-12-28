(define (domain visual-content)
	(:requirements :strips :typing :adl :equality :fluents)

	(:types contenido)
	(:types dia)

	(:functions
		(numdia ?d - dia)
		(diaAsig ?content - contenido)
		(numAsig ?d - dia)
	)

	(:predicates
		(yaPlanificado ?content - contenido)
		(visto ?content - contenido)
		(predecesor ?content - contenido ?pred - contenido)
		(paralelo ?content1 - contenido ?content2 - contenido)
		(quiereVer ?content - contenido)
	)
	;; contenido sin predecesor y sin paralelos
	(:action planning
		:parameters
			(?content - contenido ?d - dia)
		:precondition
			(and
				(< (numAsig ?d) 3)
				(not (visto ?content))
				(not (yaPlanificado ?content))
				(and
					
					(forall (?pred - contenido) 
										;; contenido sin predecesor
										(or
											(not (predecesor ?content ?pred))
											(visto ?pred)
											;; contenido con predecesor
											(or
												(not (predecesor ?content ?pred))
												(and
													(predecesor ?content ?pred)
													(or
														(visto ?pred)
														(and
															(yaPlanificado ?pred)
															(> (numdia ?d) (diaAsig ?pred))
														)
													)
												)
											)
										)
					
										
					)
					(forall (?paral - contenido) 
										(or
											;sin paralelo
											(and
												(not (paralelo ?content ?paral))
												(not (paralelo ?paral ?content))
											)
											(visto ?paral)
											;;con paralelo
											(or
											 	(or
											 		(visto ?paral)
											 		(not (yaPlanificado ?paral))
												 	(= (numdia ?d) (diaAsig ?paral))
												 	(= (numdia ?d) (+ (diaAsig ?paral) 1))
												 	(= (numdia ?d) (- (diaAsig ?paral) 1))
											 	)
											 )
										)
										
										
					)
				)
			)
		:effect
			(and 
				(forall (?paral - contenido) (when (or 
                                	(paralelo ?content ?paral)
									(paralelo ?paral ?content)
                              )
                            (quiereVer ?paral)
                        )
				)
				(yaPlanificado ?content)
				(increase (diaAsig ?content) (numdia ?d))
				(increase (numAsig ?d) 1)
			)
	)
)