
(define (domain gridworld)
  (:requirements :strips :typing)

  (:types
     cell
  )

  (:predicates
     (agent-at ?x - cell)
     (adjacent ?a - cell ?b - cell)
     (free ?x - cell)
     (blocked ?x - cell)
  )

  (:action move
     :parameters (?from - cell ?to - cell)
     :precondition (and
         (agent-at ?from)
         (adjacent ?from ?to)
         (free ?to)
     )
     :effect (and
         (not (agent-at ?from))
         (agent-at ?to)
     )
  )
)
