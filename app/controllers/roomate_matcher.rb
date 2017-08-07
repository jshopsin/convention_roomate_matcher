# create a method that finds matches - only if the given user exists in the database
def find_user(email)
  found_user = User.find_by(email: "#{email}")
  found_user.nil? ? false : true
  # if found_user.nil?
  #   user_found = false
  # else
  #   user_found = true
  # end
end

def match_user(email)
  user_found = find_user(email)
  if user_found == true
    user = User.find_by(email: "#{email}")

    user_age = user[:age].to_i
    match_age_min = ((user_age/10.round).to_s + 0.to_s).to_i
    match_age_max = match_age_min + 10

    matches = User.where(convention_id: user[:convention_id] AND gender: user[:gender], smoker: user[:smoker])
    # matches = db.execute("SELECT * FROM users WHERE email<>? AND convention_name=? AND convention_location=? AND start_date=? AND end_date=? AND (age BETWEEN ? AND ?) AND gender=? AND smoker=? AND home_state=?", [email, user[0]["convention_name"], user[0]["convention_location"], user[0]["start_date"], user[0]["end_date"], match_age_min, match_age_max, user[0]["gender"], user[0]["smoker"], user[0]['home_state']])

    puts "The profile for #{user[0]['name']} shows:"
    puts "--------------------------------------------------------------------------------------"
    puts "#{user[0]['name']} is attending #{user[0]['convention_name']} in #{user[0]['convention_location']} from #{user[0]['start_date']} through #{user[0]['end_date']}."
    puts "#{user[0]['name']} is from #{user[0]['home_city']}, #{user[0]['home_state']}."
    puts "#{user[0]['name']} is #{user[0]['gender']} and is #{user[0]['age']} years old."
    if user[0]['smoker'] == "true"
      puts "#{user[0]['name']} is a smoker."
    elsif user[0]['smoker'] == "false"
      puts "#{user[0]['name']} is not a smoker."
    end
    puts "-------------------------------------------------------------------------------------- \n\n"

    if matches.empty?
      puts "There are no matches for #{user[0]['gender']} attendees of #{user[0]['convention_name']} with the same dates as you that also live in the same state, are in the same age range as you and that share your smoking preference."
      puts "Would you like to expand your search? Type 'yes' or 'no'."
      response = gets.chomp
      until response == "yes" || response == "no"
        puts "Please respond 'yes' or 'no'."
        response = gets.chomp!
      end
      if response == "yes"
        matches = db.execute("SELECT * FROM users WHERE email<>? AND convention_name=? AND convention_location=? AND start_date=? AND end_date=? AND gender=?", [email, user[0]["convention_name"], user[0]["convention_location"], user[0]["start_date"], user[0]["end_date"], user[0]["gender"]])

        puts "#{user[0]['name']}'s possible matches:"
        matches.each do |match|
          puts "--------------------------------------------------------------------------------------"
          puts "#{match['name']} is attending #{match['convention_name']} in #{match['convention_location']} from #{match['start_date']} through #{match['end_date']}."
          puts "#{match['name']} is from #{match['home_city']}, #{match['home_state']}."
          puts "#{match['name']} is #{match['gender']} and is #{match['age']} years old."
          if match['smoker'] == "true"
            puts "#{match['name']} is a smoker."
          elsif match['smoker'] == "false"
            puts "#{match['name']} is not a smoker."
          end
          puts "-------------------------------------------------------------------------------------- \n\n"
        end
      end
    else
      puts "#{user[0]['name']}'s possible matches:"
      matches.each do |match|
        puts "--------------------------------------------------------------------------------------"
        puts "#{match['name']} is attending #{match['convention_name']} in #{match['convention_location']} from #{match['start_date']} through #{match['end_date']}."
        puts "#{match['name']} is from #{match['home_city']}, #{match['home_state']}."
        puts "#{match['name']} is #{match['gender']} and is #{match['age']} years old."
        if match['smoker'] == "true"
          puts "#{match['name']} is a smoker."
        elsif match['smoker'] == "false"
          puts "#{match['name']} is not a smoker."
        end
        puts "-------------------------------------------------------------------------------------- \n\n"
      end
    end
  end
end