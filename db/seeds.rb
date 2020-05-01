# Fake Users Accounts
brandon = User.create(name: "Brandon", email: "brandon@gmail.com", password: "password")
morning_routine = Routine.create(name: "Morning Delight", times_per_week: 3, user_id: brandon.id)
exercise1 = Exercise.create(name: "Crunches", exercise_type: "Abdominal", description: "works the rectus abdominis muscle", sets: 2, reps: 10, routine_id: morning_routine.id)
exercise2 = Exercise.create(name: "Jumping Jacks", exercise_type: "Jump", description: "jump with the legs spread wide and the hands going overhead", sets: 2, reps: 15, morning_routine.id)


greg = User.create(name: "Greg", email: "greg@gmail.com", password: "password")
afternoon_routine = Routine.create(name: "Afternoon Struggle", times_per_week: 3, user_id: greg.id)
exercise1 = Exercise.create(name: "Push-ups", exercise_type: "Calisthenics", description: "works the pectoral muscles, triceps, and anterior deltoids", sets: 2, reps: 15, routine_id: afternoon_routine.id)
exercise2 = Exercise.create(name: "Sit-ups", exercise_type: "Abdominal", description: "works the abdomin; similar to crunches but works some extra muscles", sets: 3, reps: 15, afternoon_routine.id)


joe = User.create(name: "Joe", email: "joe@gmail.com", password: "password")
evening_routine = Routine.create(name: "Morning Delight", times_per_week: 3, user_id: joe.id)
exercise1 = Exercise.create(name: "Run/ Jog", exercise_type: "Cardiovascular", description: "improves cardio and respiratory health", sets: 1, reps: 1, routine_id: evening_routine.id)
exercise2 = Exercise.create(name: "Jumping Jacks", exercise_type: "Jump", description: "jump with the legs spread wide and the hands going overhead", sets: 2, reps: 15, evening_routine.id)


ryan = User.create(name: "Ryan", email: "ryan@gmail.com", password: "password")
late_night_routine = Routine.create(name: "Morning Delight", times_per_week: 3, user_id: ryan.id)
exercise1 = Exercise.create(name: "Crunches", exercise_type: "Abdominal", description: "works the rectus abdominis muscle", sets: 2, reps: 10, routine_id: late_night_routine.id)
exercise2 = Exercise.create(name: "Jumping Jacks", exercise_type: "Jump", description: "jump with the legs spread wide and the hands going overhead", sets: 2, reps: 15, late_night_routine.id)
