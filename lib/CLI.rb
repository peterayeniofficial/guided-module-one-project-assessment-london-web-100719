class CommandLineInterface
  def greet
    10.times {puts "\n"}
    puts 'Welcome to Wayfarer!'
      hello =
    puts "                                       ,d8888b                          
                                      88P'                             
                                   d888888P                            
 ?88   d8P  d8P d888b8b  ?88   d8P   ?88'     d888b8b    88bd88b d8888b
 d88  d8P' d8P'd8P' ?88  d88   88    88P     d8P' ?88    88P'  `d8b_,dP
 ?8b ,88b ,88' 88b  ,88b ?8(  d88   d88      88b  ,88b  d88     88b    
 `?888P'888P'  `?88P'`88b`?88P'?8b d88'      `?88P'`88bd88'     `?888P'
                                )88                                    
                               ,d8P                                    
                            `?888P'                                    
 "
    
  
  end

  def user_response
    puts 'Thinking of geting away? We can help you with that decision!'
    puts 'Enter the destination you want to go:'
    gets.chomp
  end

  def get_destinations(query)
    Trip.find_trip_by_destination(query)
  end

  def run
    greet
    render(get_destinations(user_response))
  end

  private

  def render(array)
    array.each do |trip|
      puts "#{trip.origin} #{trip.destination}"
    end
  end
end
