# for User
# Faker::FunnyName.two_word_name
# Faker::Internet.email

# # for trip
# Faker::Address.city.unique
# Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)
# Faker::Number.decimal(l_digits: 2)
# Faker::Boolean.boolean

10.times do
  name = Faker::FunnyName.two_word_name.split(' ')[0]
  User.create(
    email: Faker::Internet.email,
    first_name: name,
    last_name: name
  )
end

25.times do 
  Trip.create(
    origin: Faker::Address.unique.city,
    destination: Faker::Address.unique.city,
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