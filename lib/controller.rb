module Controller

  def my_trips
    puts "Please Enter your email to get all your Booked Trips: "
    email = gets.chomp
    my_trips = User.my_trips(email)
    puts "||||||||| Kindly Fdnd your Trips bellow |||||||||"
    render(my_trips)
    new_lines
    menu
  end

  def trip_by_destination
    puts 'Thinking of geting away? We can help you with that decision!'
    puts 'Enter the destination you want to go:'
    query = gets.chomp
    results = find_trip_by_destination(query)
    render(results)
  end

  def create_account
    puts 'First Name: '
    f_name = gets.chomp

    puts 'Last Name: '
    l_name = gets.chomp

    puts 'Email: '
    email = gets.chomp

    create_user = User.find_or_create_by(first_name: f_name, last_name: l_name, email: email)
    new_lines
    puts "Welcome #{create_user.first_name} #{create_user.last_name}"

    new_lines

    menu
  end

  def update_account
    puts 'Your Email'
    email = gets.chomp
    user = User.find_by(email: email)
    update = false
    if user 
      puts "\n"
      puts "Thank you! your current information are #{user.first_name}, #{user.last_name}"
      puts "\n"
      puts "New Email: "
      email = gets.chomp
      puts "\n"
      puts "New First Name: "
      f_name = gets.chomp
      puts "\n"
      puts "New Last Name: "
      l_name = gets.chomp
      update = user.update(first_name: f_name, last_name: l_name, email: email)
      # puts "Thank you! your new information are #{user.first_name}, #{user.last_name}"
    else
      puts "You don't have an account with us please press 1 to create one"
    end
    new_lines
    puts "Thank you! your new information are Name: #{user.first_name} #{user.last_name} | Email: #{user.email} " if update == true
    new_lines

    menu
  end

  def first_ten_trips
    results = Trip.first_ten
    render(results)
    new_lines

    menu
  end

  def delete_a_booking
    puts "Please Enter your email to get all your Bookings: "
    email = gets.chomp
    me = User.find_by(email: email)
    bookings = me.bookings
    puts "||||||||| Kindly Find your bookings bellow |||||||||"
    render_bookings(bookings)
    new_lines
    if bookings
      puts "Please Enter the ID of the booking to delete"
      booking_id = gets.chomp
      deleted = bookings.find_by(id: booking_id).delete
      puts "Booking with ID #{deleted.id} Succesfully Deleted"
      new_lines
    else
      puts "You have know bookings at this moment"
    end 
    menu    

  end

  def delete_account
    puts 'You Really Want to Stop Seeing Great Places'
    puts 'Please enter your Email: '
    email = gets.chomp
  
    user = User.find_by(email: email)
    if user
      delete = user.delete
      new_lines
      puts "Sad to see you go #{delete.first_name} #{delete.last_name}. Account Deleted Successful"
      new_lines
      menu
    else
      puts "You don't have an account with us please press 1 to create one"
    end
  
  end

    
end