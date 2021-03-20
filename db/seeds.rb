puts "Cleaning database..."
Tweet.destroy_all
User.destroy_all

puts "Creating records..."

50.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: "123123",
    username: Faker::Internet.username,
    bio: Faker::Quote.famous_last_words,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone_number: Faker::PhoneNumber.cell_phone,
    user_account: Faker::Internet.username
  )
end


users = User.all

users.each do |user|
  10.times do
    Tweet.create!(
      content: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 20),
      user: user,
      replies_count: rand(0..150),
      retweets_count: rand(0..300),
      likes_count: rand(0..500)
    )
  end
  user.followings << users.sample(30)
  user.followers << users.sample(30)
end

puts "Finished!"