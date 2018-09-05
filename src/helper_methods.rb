require "terminal-table"
require_relative "user_profiles"
require_relative "transaction"
require_relative "items"

def login(username, password)
  users = User.new
  auth = false
  attempt = 1
  max_attempt = 4

  while auth == false
    if users.user_password_match?(username, password) == true
      system("clear")
      puts "Success, welcome to GET ME THE MONEY!!! POS System #{users.lookup_user_profile("#{username}")["fullname"]}."
      puts ""
      option_list(username)
      auth = true
    else
      system("clear")
      attempt += 1
      puts "Incorrect details, please try again"

      if attempt < max_attempt
        puts "Attempt #{attempt} - #{max_attempt - attempt} attempts remaining!"
      else
        puts "Sorry too many incorrect attempts, please contact management"
        break
      end

      puts "\n\nPlease enter your Username and Password"
      print "Username: "
      username = gets.chomp!
      print "\nPassword: "
      password = STDIN.noecho(&:gets).chomp
    end
  end
end

def option_list(username)
  sleep(0.5)
  rows = []
  rows << ["Item Database", "1\n2", "Add Item\nSearch an Item by code"]
  rows << ["Transaction", "3\n4", "Record new POS transactions\nSearch Transaction by transaction ID"]
  rows << ["Reports", "5\n6", "List all Items\nView all transaction"]
  rows << ["System", "7\n8\n9", "Update User Profiles\nAbout Developers\nExit System"]
  table = Terminal::Table.new :title => "GET ME THE MONEY!!! POS System", :headings => ["Categories", "Options", "Functions"], :rows => rows, :style => {:width => 80, :padding_left => 3, :border_x => "="}
  puts table
  puts ""
  print ">>  "
  get_option = (gets.chomp).to_i

  case get_option
  when get_option = 1 #add item
    system("clear")
    puts ""
    item = Item.new(username)
    item.add_item
    puts "puts"
    option_list(username)
  when get_option = 2 # search item by code
    system("clear")
    puts ""
    item = Item.new(username)
    item.look_up_item
    option_list(username)
  when get_option = 3 # start new transaction
    system("clear")
    puts ""
    transaction = Transaction.new(username)
    transaction.record_transactions(username)
    option_list(username)
  when get_option = 4 # look up by transaction ID
    system("clear")
    puts ""
    transaction = Transaction.new(username)
    transaction.lookup_transaction
    option_list(username)
  when get_option = 5 # list all items
    system("clear")
    puts ""
    item = Item.new(username)
    item.list_all_items
    option_list(username)
  when get_option = 6 # view all transactions
    system("clear")
    puts ""
    transaction = Transaction.new(username)
    transaction.list_all_transaction
    option_list(username)
  when get_option = 7 # Change user profile
    system("clear")
    puts ""
    puts "Upgrade to the paid version :)"
    puts ""
    puts ""
    option_list(username)
  when get_option = 8 # About developers
    system("clear")
    puts ""
    puts "With love from Santosh and Theo\n"
    puts "contacts: santosh.poudyal@gmail.com"
    puts "          theo_the_hero@gmail.com"
    puts ""
    option_list(username)
  when get_option = 9 # exit
    system("clear")
    puts ""
    puts "See you next time!"
    puts ""
    sleep(0.5)
    puts "    Don't work too hard."
    puts ""
    sleep(0.5)
  else
    system("clear")
    puts "Invalid Selection try again!!!"
    puts ""
    puts ""
    option_list(username)
  end
end
