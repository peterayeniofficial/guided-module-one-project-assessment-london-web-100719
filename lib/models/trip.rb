class Trip < ActiveRecord::Base
  has_many :bookings
  has_many :users, through: :bookings

  def self.find_trip_by_destination(query)
    where('destination = ? ', query)
  end
end
