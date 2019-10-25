class Trip < ActiveRecord::Base
  has_many :bookings
  has_many :users, through: :bookings

  def self.find_trip_by_destination(query)
    results = where('destination = ? ', query)
    if results.empty? == true
      nill
    else
      results
    end
  end

  def self.find_by_id(id)

    trip = Trip.find_by(id: id)
    if trip == nil
      return nil
    else
      trip 
    end
  end

  def self.first_ten
    Trip.take(10)
  end
end
