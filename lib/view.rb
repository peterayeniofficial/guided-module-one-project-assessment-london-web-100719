module View
  def greet
    10.times { puts "\n" }
    puts 'Welcome to Wayfarer!'
    brand
  end

  def menu 
    puts '[1] To Create an Account Press 1'
    puts '[2] To Book a Trip Press 2'
    puts '[3] To Check your Booked Trips 3'
    puts '[4] To Cancel a Booking Press 4'
    puts '[5] To Check Trip by Destination Press 5'
    puts '[6] To Check Available Trips Press 6'
    puts '[7] To Update your account 7'
    puts '[8] To Delete your Account Press 8'
    puts '[9] To Quit press any Key'

    ch = STDIN.getch
      case ch
      when "1"
        new_lines
        create_account
      when "2"
        create_booking
      when "3"
        new_lines
        my_trips
      when "4"
        new_lines
        delete_a_booking
      when "5"
        new_lines
        trip_by_destination
      when "6"
        new_lines
        first_ten_trips
        new_lines
        menu
      when "7"
        new_lines
        update_account
      when "8"
        new_lines
        delete_account
      when "9"
        'Good bye'
      else
        'Please enter a valid response from the Menu. eg: [1] to create an account'
      end
  end

  private 

  def brand
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
end
