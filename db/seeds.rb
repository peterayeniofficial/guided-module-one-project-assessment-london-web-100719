# for User
# Faker::FunnyName.two_word_name
# Faker::Internet.email

# # for trip
# Faker::Address.city.unique
# Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)
# Faker::Number.decimal(l_digits: 2)
# Faker::Boolean.boolean

10.times do
  first_name = Faker::FunnyName.two_word_name.split(' ')[0]
  last_name = Faker::FunnyName.two_word_name.split(' ')[1]
  User.create(
    email: Faker::Internet.email,
    first_name: first_name,
    last_name: last_name
  )
end

25.times do 
  Trip.create(
    origin: Faker::Address.city,
    destination: Faker::Address.city,
    trip_date: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
    fare: Faker::Number.decimal(l_digits: 2),
    active: Faker::Boolean.boolean(true_ratio: 0.5)
  )
end

50.times do 
  Booking.create(
    user_id: User.all.sample.id,
    trip_id: Trip.all.sample.id
  )
end

# 10.times do |count|
#    User.create(
#      username: "user#{count + 1}", 
#      password: Faker::Team.creature, 
#      logged_in: Faker::Boolean.boolean(true_ratio: 0.5)
#     )
# end