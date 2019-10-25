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

  


  # def self.create
  #   User.find_or_create_by(first_name: first_name, last_name: last_name, email: email)
  # end

  def self.first_ten 
    self.take(10)
  end

  def self.find_user_by_email(email)
    user = self.find_by(email: email)
    if user == nil 
      nil
    else
      user
    end

  end
  
  def self.my_bookings(email)
    user = self.find_by(email: email)
    if user == nil 
      nil
    else
      user.bookings
    end

  end

  

  # As a User, I want to see all my trips (Read)
  def self.my_trips(email)
    user = find_by(email: email)
    if user == nil 
      nil
    else
      user.trips
    end
  end

  def self.delete_trip(id)
    id = id.to_i
    
  end


  def self.delete_a_user
    find_user_by_email.delete
  end

  def self.update_user(props={})
    email = props['email']
    first_name = props['first_name']
    last_name = props['last_name']
    user = find_user_by_email(email)
    user.update(first_name: first_name, last_name: last_name, email: email)
  end


end