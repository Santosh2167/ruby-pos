require_relative "models/user_profiles"

def login
  users = User.new
  username = ""
  password = ""
  auth = false
  attempt = 1
  max_attempt = 4

  while auth == false
    if attempt < max_attempt
      if attempt > 1
        p "Attempt #{attempt} - #{max_attempt - attempt} attempts remaining!"
      end
    else
      p "Sorry too many incorrect attempts, please contact management"
      break
    end

    puts "\n\nPlease enter your Username and Password"
    print "Username: "
    username = gets.chomp!
    print "\nPassword: "
    password = gets.chomp!

    if users.user_exist?(username) == true && users.password_match?(username, password) == true
      auth = true
      system("clear")
      p "Success, welcome to Ezeee Pzeee"
    else
      system("clear")

      attempt += 1
      p "Incorrect details, please try again"
    end
  end
end

### TESTS
# users = User.new
# p users.list_all_users # returns hash of hashes
# p users.lookup_user_profile("azane") # returns hash
