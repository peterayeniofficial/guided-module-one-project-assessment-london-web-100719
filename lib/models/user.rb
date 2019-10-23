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

  # As a User, I want to see all my trips (Read)


  def self.create
    User.find_or_create_by(first_name: first_name, last_name: last_name, email: email)
  end

  def self.first_ten
    self.take(10)
  end

  def find_user_by_email(email)
    self.find_by(email: email)
  end

  def self.delete_a_user
    find_user_by_email.delete
  end

  def self.update_user(email, first_name, last_name)
    user = find_user_by_email
    user.update(first_name: first_name, last_name: last_name, email: email)
  end


end