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

  def trip_by_destination
    puts 'Thinking of geting away? We can help you with that decision!'
    puts 'Enter the destination you want to go:'
    query = gets.chomp
    results = Trip.where('destination = ? ', query)
    render(results)
  end

  def create_account
    puts 'First Name: '
    first_name = gets.chomp

    puts 'Last Name: '
    last_name = gets.chomp

    puts 'Email: '
    email = gets.chomp

    create_user = User.find_or_create_by(first_name: first_name, last_name: last_name, email: email)
    puts "\n"
    puts "\n"
    puts "Welcome #{create_user.first_name} #{create_user.last_name}"
  end

  def first_ten_trips
    results = Trip.take(10)
    render(results)
  end

  

  def menu 
    puts "[1] To Create an Account Press 1"
    puts "[2] To Check Trip by Destination Press 2"
    puts "[3] To Check Available Trips Press 3"
    puts "[4] To Update your account 4"
    puts "[5] To Delete your Account Press 5"
    puts "[6] To Quit press 6"

    ch = STDIN.getch
  
      case ch
      when "1"
        puts "\n"
        puts "\n"
        create_account
      when "2"
        puts "\n"
        puts "\n"
        trip_by_destination
      when "3"
        puts "\n"
        puts "\n"
        first_ten_trips
      when "6"
        'Good bye'
      else
        'Please enter a valid response from the Menu. eg: [1] to create an account'
      end
  end

  def run
    greet
    menu
  end

  private

  def render(array)
    array.each do |trip|
      puts "Going to #{trip.destination} from #{trip.origin} "
    end
  end
end
