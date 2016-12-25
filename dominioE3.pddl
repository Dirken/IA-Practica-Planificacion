(define (domain visual-content)
	(:requirements :strips :typing :adl :equality :fluents)

	(:types contenido)
	(:types dia)

	(:functions
		(numdia ?d - dia)
		(diaAsig ?content - contenido)
	)

	(:predicates
		(yaPlanificado ?content - contenido)
		(visto ?content - contenido)
		(predecesor ?content - contenido ?pred - contenido)
		(paralelo ?content1 - contenido ?content2 - contenido)
		(quiereVer ?content - contenido)
	)
	;; contenido sin predecesor y sin paralelos
	(:action primero
		:parameters
			(?content - contenido ?d - dia)
		:precondition
			(and
				(not (visto ?content))
				(not (yaPlanificado ?content))
				(forall (?pred - contenido) (or
											(not (predecesor ?content ?pred))
											(visto ?pred)
										)
				)
				(forall (?paral - contenido) (or
											(and
												(not (paralelo ?content ?paral))
												(not (paralelo ?paral ?content))
											 )
											(visto ?paral)
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
			)
	)
	;; contenido con predecesor y sin paralelo
	(:action segundo
		:parameters
			(?content - contenido ?d - dia)
		:precondition
			(and
				(not (visto ?content))
				(not (yaPlanificado ?content))
				(forall (?pred - contenido) (or
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
				(forall (?paral - contenido) (or
											(and
												(not (paralelo ?content ?paral))
												(not (paralelo ?paral ?content))
											 )
											(visto ?paral)
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
			)
	)
		;; contenido sin predecesor y con paralelo
	(:action tercero
		:parameters
			(?content - contenido ?d - dia)
		:precondition
			(and
				(not (visto ?content))
				(not (yaPlanificado ?content))
				(forall (?pred - contenido) (or
											(not (predecesor ?content ?pred))
											(visto ?pred)
										)
				)
				(forall (?paral - contenido) (or
											(and
												(not (paralelo ?content ?paral))
												(not (paralelo ?paral ?content))
										 	)
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
			)
	)
	;; contenido con predecesor y con paralelo
	(:action cuarto
		:parameters
			(?content - contenido ?d - dia)
		:precondition
			(and
				(not (visto ?content))
				(not (yaPlanificado ?content))
				(forall (?pred - contenido) (or
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
				(forall (?paral - contenido) (or
											(and
												(not (paralelo ?content ?paral))
												(not (paralelo ?paral ?content))
										 	)
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
			)
	)
)