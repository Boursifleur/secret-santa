Participant.destroy_all
Event.destroy_all
User.destroy_all

puts "--------------"
puts "Starting seed"
puts "--------------"

user = User.create!(email: "florian.daniel@gmail.com",password:"password")
event = Event.create!(name:"santa", price: 30, user: user)

3.times do
  Participant.create!(name:"#{Faker::Artist.name}", event: event)
end

puts "--------------"
puts " Well done : seed over !"
puts "--------------"
