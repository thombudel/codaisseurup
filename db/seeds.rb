User.destroy_all

tim=User.create(email:"timdevries@gmail.com", password:"hallo123")

event=Event.create(name:"Best event of the year", description: "You don't want to miss this event,
it is the best one you'll find this year! Please come!", location: "Sarphatipark 116, 1073ED Amsterdam",
price: 75, capacity: 100, includes_food: true, includes_drinks: true, starts_at: DateTime.new(2017,10,30,20,30,0),
ends_at: DateTime.new(2017,11,5,5,0,0), active: true, user: tim)
