module Controller

  def my_trips
    new_lines
    puts "Please Enter your email to get all your Booked Trips: "
    email = gets.chomp
    my_trips = User.my_trips(email)
    new_lines
    if my_trips == nil
      puts "||||||||| Please enter your valid email or create an account |||||||||"
      new_lines

    elsif my_trips.size.zero?
      puts "||||||||| You currently don't have any booked trips |||||||||"
      new_lines
    else
      puts "||||||||| Kindly Find your Trips bellow |||||||||"
      render(my_trips)
      new_lines
    end

    menu
  end

  def trip_by_destination
    new_lines
    puts 'Thinking of geting away? We can help you with that decision!'
    puts 'Enter the destination you want to go: eg Trantowstad, Stanborough '
    query = gets.chomp
    results = Trip.find_trip_by_destination(query)
    if results == nil
      puts 'Sorry Destination not available'
    else
      puts "||||||||| Trips for this destination |||||||||"
      new_lines
      render(results)
      new_lines
    end
    menu
  end

  def create_account
    new_lines
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

  def create_booking
    new_lines
    puts "Ready to get away"
    puts "Please Enter your Email: "
    email = gets.chomp
    user = User.find_user_by_email(email)
    new_lines
    puts "#{user.first_name}, See available destinations"
    first_ten_trips
    new_lines
    puts "Please enter the ID of the trip to book"
    get_trip_id = gets.chomp
    get_trip_id = get_trip_id.to_i
    trip = Trip.find_by_id(get_trip_id)
    if trip == nil
      puts "Invalid ID"
    else
      new_lines
      created = Booking.create(user_id: user.id, trip_id: trip.id)
      puts "||||||||| Your Trip Details |||||||||"
      puts "Booking created succesully on #{created.created_at}"
      results = user.trips
      render(results)
      new_lines
    end
    menu

  end

  def update_account
    new_lines
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
    new_lines
    results = Trip.first_ten
    puts "||||||||| Ready to escape Available Trips |||||||||"
    render(results)
    new_lines
  end

  def delete_a_booking
    new_lines
    puts "Please Enter your email to get all your Bookings: "
    email = gets.chomp
    bookings = User.my_bookings(email)
    new_lines
    if bookings == nil
      puts "You have know bookings at this moment"
      new_lines
    else

      puts "||||||||| Kindly Find your bookings bellow |||||||||"
      render_bookings(bookings)
      new_lines
      puts "Please Enter the ID of the booking to delete"
      booking_id = gets.chomp
      to_delete = bookings.find_by(id: booking_id)
      if to_delete == nil
        puts "The ID does not exist"
      else
        deleted = to_delete.delete
        puts "Booking with ID #{deleted.id} Succesfully Deleted"
        new_lines
      end
    end 
    menu    

  end

  def delete_account
    new_lines
    puts 'You Really Want to Stop Seeing Great Places'
    puts 'Please enter your Email: '
    email = gets.chomp
    
    user = User.find_user_by_email(email)
    new_lines
    if user == nil
      puts "You don't have an account with us please press 1 to create one"
      new_lines
    else
      delete = user.delete
      new_lines
      puts "Sad to see you go #{delete.first_name} #{delete.last_name}. Account Deleted Successful"
      new_lines
     
    end
    menu
  
  end

  private 
  def valid_email?(email)
    if (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i) == nil 
      false
    else
      true
    end
  end

    
end