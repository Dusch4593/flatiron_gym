# Fake Users Accounts
brandon = User.create(name: "Brandon", email: "brandon@gmail.com", password: "password")
brandon_exercise1 = Exercise.create(name: "Crunches", exercise_type: "Abdominal", description: "works the rectus abdominis muscle", sets: 2, reps: 10, user_id: brandon.id)
brandon_exercise2 = Exercise.create(name: "Jumping Jacks", exercise_type: "Jump", description: "jump with the legs spread wide and the hands going overhead", sets: 2, reps: 15, user_id: brandon.id)


greg = User.create(name: "Greg", email: "greg@gmail.com", password: "password")
greg_exercise1 = Exercise.create(name: "Push-ups", exercise_type: "Calisthenics", description: "works the pectoral muscles, triceps, and anterior deltoids", sets: 2, reps: 15, user_id: greg.id)
greg_exercise2 = Exercise.create(name: "Sit-ups", exercise_type: "Abdominal", description: "works the abdomin; similar to crunches but works some extra muscles", sets: 3, reps: 15, user_id: greg.id)


joe = User.create(name: "Joe", email: "joe@gmail.com", password: "password")
joe_exercise1 = Exercise.create(name: "Run/ Jog", exercise_type: "Cardiovascular", description: "improves cardio and respiratory health", sets: 1, reps: 1, user_id: joe.id)
joe_exercise2 = Exercise.create(name: "Jumping Jacks", exercise_type: "Jump", description: "jump with the legs spread wide and the hands going overhead", sets: 2, reps: 15, user_id: joe.id)


ryan = User.create(name: "Ryan", email: "ryan@gmail.com", password: "password")
ryan_exercise1 = Exercise.create(name: "Crunches", exercise_type: "Abdominal", description: "works the rectus abdominis muscle", sets: 2, reps: 10, user_id: ryan.id)
ryan_exercise2 = Exercise.create(name: "Jumping Jacks", exercise_type: "Jump", description: "jump with the legs spread wide and the hands going overhead", sets: 2, reps: 15, user_id: ryan.id)
