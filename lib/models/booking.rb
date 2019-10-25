class Booking < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user

  # Select User
  # Select Trip
  # Add to Booking
end
