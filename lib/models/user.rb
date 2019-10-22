class User < ActiveRecord::Base
  has_many :bookings
  has_many :trips, through: :bookings

  # def self.create
  #   new_user = User.find_or_create_by(first_name: first_name, last_name: last_name, email: email)
  #   new_user
  # end

  # def self.latest_user
  #   User.all.last
  # end
end
