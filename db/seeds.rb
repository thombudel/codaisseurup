Photo.delete_all
Category.delete_all
Event.delete_all
Profile.delete_all
User.delete_all


tim=User.create!(
email:"timdevries@gmail.com",
password:"hallo123"
)



photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/deu9tctoc/image/upload/v1489671130/2014_06_BMBC_VCBW-8961_xo33bx.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/deu9tctoc/image/upload/v1489671304/Party_Dream_Color_party_ercym8.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/deu9tctoc/image/upload/v1489671204/images_c3ptbn.jpg")



Event.create!(
name:"Best event of the year",
description: "You don't want to miss this event,
it is the best one you'll find this year! Please come!",
location: "Sarphatipark 116, 1073ED Amsterdam",
price: 75.00,
capacity: 100,
includes_food: true,
includes_drinks: true,
starts_at: DateTime.new(2017,10,30,20,30,0),
ends_at: DateTime.new(2017,11,5,5,0,0),
active: true,
user: tim,
photos: [photo1]
)

Event.create!(
name:"Beer and Football Weekend",
description: "It is time for the yearly beer and football weekend!
Please bring your own food.",
location: "Amsterdam Arena, 1088ED Amsterdam",
price: 35.00,
capacity: 50,
includes_food: false,
includes_drinks: true,
starts_at: DateTime.new(2017,5,10,12,00,0),
ends_at: DateTime.new(2017,5,12,12,0,0),
active: true,
user: tim,
photos: [photo2, photo3]
)


Category.create!([
   { name: "Movements" },
   { name: "Outdoors & Adventure" },
   { name: "Tech" },
   { name: "Family" },
   { name: "Health & Wellness" },
   { name: "Sports & Fitness" },
   { name: "Learning" },
   { name: "Photography" },
   { name: "Food & Drink" },
 ])


 event = Event.find_by(name: "Beer and Football Weekend")
 event.categories << Category.find_by(name: "Outdoors & Adventure")
 event.categories << Category.find_by(name: "Sports & Fitness")
 event.categories << Category.find_by(name: "Food & Drink")
