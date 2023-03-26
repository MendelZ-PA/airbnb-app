puts "Seeding..."

User.create([
  { name: "Kathleen", email: "kathleen@test.com", password: "password", image: "user_image.jpg" },
  { name: "Aakash", email: "aakash@test.com", password: "password", image: "user_image.jpg" },
  { name: "Mendel", email: "mendel@test.com", password: "password", image: "user_image.jpg" },
])

Room.create([
  { user_id: 1, address: "108 Woodlands Rd", city: "Austin", state: "Texas", price: 283, description: "Clean, Zen modern backyard cottage, easy access to SXSW, convention center, great dining, and public transportation. Gorgeous, peaceful space, close to the action but perfect for rest and recharging.", home_type: "Tiny Home", room_type: "Entire Place", total_occupancy: 2, total_bedrooms: 1, total_bathrooms: 1 },
  { user_id: 2, address: "215 Cabin Dr.", city: "Sevierville", state: "Tennessee", price: 199, description: "The Barkhouse is the only fully tree supported structure in the Gatlinburg/Pigeon Forge area.  Located just minutes from all the major attractions in the area and only 5 miles from the Greenbriar entrance to the GSMNP.", home_type: "Treehouse", room_type: "Entire Place", total_occupancy: 2, total_bedrooms: 1, total_bathrooms: 1 },
  { user_id: 3, address: "408 Ocean Rd.", city: "Melbourne", state: "Florida", price: 1250, description: "Stunning XL 3 story Beach House located on the Atlantic Ocean on 1.2 acres spectacular views of the ocean and private beach access.", home_type: "Beach House", room_type: "Entire Place", total_occupancy: 12, total_bedrooms: 5, total_bathrooms: 6 },
  { user_id: 1, address: "122 Creek Ln", city: "LaFollette", state: "Tennessee", price: 125, description: "Charming 1 bedroom cabin apt with kitchenette and living room.", home_type: "Barn", room_type: "Private Room", total_occupancy: 3, total_bedrooms: 1, total_bathrooms: 1 },
])

RoomImage.create([
  { room_id: 1, url: "https://a0.muscache.com/im/pictures/82c577ee-3422-4fda-ae09-6716d76e8bef.jpg?im_w=720" },
  { room_id: 1, url: "https://a0.muscache.com/im/pictures/69347092/f4d57c4d_original.jpg?im_w=720" },
  { room_id: 2, url: "https://a0.muscache.com/im/pictures/d63eb97e-864a-4e02-866d-8b8cb53a58e6.jpg?im_w=720" },
  { room_id: 3, url: "https://a0.muscache.com/im/pictures/miso/Hosting-588522225012256386/original/ae78fa52-f46c-4f78-b4e1-7f933585b26d.jpeg?im_w=1200" },
  { room_id: 4, url: "https://a0.muscache.com/im/pictures/3cf926d4-e3aa-460e-b1f8-d94ea6352f4e.jpg?im_w=1200" },
])

puts "...Done!"
