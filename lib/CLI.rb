require_relative '../lib/controller.rb'
require_relative '../lib/view.rb'

class CommandLineInterface

  include Controller
  include View

  def run
    greet
    menu
  end

  private

  def render(trips)
    trips.each do |trip|
      active = ''
      if trip.active == false
        active = 'Canceled'
      else
        active = 'Active'
      end
      puts "\nID:: #{trip.id} Going to #{trip.destination} from #{trip.origin},
            Fare: #{trip.fare} :: Date: #{trip.trip_date} :: Status=> #{active}\n"
    end
  end

  def render_bookings(bookings)
    bookings.each do |booking|
      puts "\nID:: #{booking.id} Booked ON:: #{booking.created_at}"
    end
  end

  def new_lines
    puts "\n\n"
  end
end
