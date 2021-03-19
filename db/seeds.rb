puts "Cleaning database..."
User.destroy_all

puts "Creating records..."

25.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: "123123",
    username: Faker::Internet.username,
    bio: Faker::Quote.famous_last_words,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

puts "Finished!"