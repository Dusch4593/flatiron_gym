# NOTES

Each user can log in/ or create an account and create multiple routines. Each
routine may have many exercises.


### Models & Associations

A User `has_many` routines

A Routine `has_many` routine_exercises
A Routine `has_many` exercises, through routine_exercises

An Exercise `has_many` routine_exercises
An Exercise 'has_many' routines, through routine_exercises

Summary: A User should be able to have many routines, each of which may have many  
exercises. Exercises, in turn, may exist in more than one routine for that user.
This should be possible with the join table `RoutineExercise`.
