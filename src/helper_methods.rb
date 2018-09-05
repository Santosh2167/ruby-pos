require_relative "user_profiles"
require_relative "transaction"
require_relative "items"

def login(username, password)
  users = User.new
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

    if users.user_password_match?(username, password) == true
      auth = true
      system("clear")
      p "Success, welcome to GET ME THE MONEY POS #{username}"
      username
    else
      system("clear")
      attempt += 1
      p "Incorrect details, please try again"
    end
  end
  
end

def option_list(username) 

get_option = 0

puts "Please choose one of the following options to proceed !!!"
puts ""
puts "Items >> 1. Add Item  2. Search an Item by code 10. Edit Item*\n"
puts ""
puts "Transactions >> 3. Record new POS transaction  4. Search Transaction by transaction ID\n"
puts ""
puts "Reports >> 5. List all Items 6. View all transaction"
puts ""
puts "System >> 7. Change User Name and Password 8. About Developers 9. Exit"

get_option = (gets.chomp).to_i

case get_option
when get_option = 1 #add item 
  system("clear")
  puts ""
  item = Item.new(username)
  item.add_item
  p "puts"
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
when get_option = 5  # list all items
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
  puts "------------------------------"
  option_list(username) 
when get_option = 9 # exit
  system("clear")
  puts ""
  puts "See you next time!"
when get_option = 10 #edit items
  system("clear")
  item = Item.new(username)
  item.edit_item

else
  system("clear")
  puts "Invalid Selection try again!!!"
  puts ""
  puts ""
  option_list
end
end


