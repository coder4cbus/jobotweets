# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy.all

u = User.create!(
  first_name: "Joe",
  last_name:  "O'Brien",
  email: 'coder4cbus@gmail.com'
  password: 'TTSb00tcamp'
  password_confirmation: 'TTSb00tcamp'
  username: "objo",
  bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  city: "Westerville",
  state: "Ohio",
)
# u.tweets.find_or_create_by!(message: "something about my food today")

puts "User Joe created? #{u.persisted?}"
puts "Destroying Tweets"
u.tweets.destroy_all
puts "\t I now have #{u.tweets.count} tweets"

source = [ Faker::Movie, Faker::BackToTheFuture, Faker::DrWho, Faker::Simpsons ]

20.times do
  putc "."
u.tweets.create!(message: source.sample.quote, created_at: Faker::Date.between(2.months.ago, Time.now)
)
end

puts "done"
