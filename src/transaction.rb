require "yaml"
require "date"
require_relative "helper_methods.rb"

class Transaction
    
    TRANSACTION_FILE = "transactions.yml"
    ITEM_FILE = "items.yml"   

    def initialize user
        @transactions ||= YAML.load(File.read(TRANSACTION_FILE))
        @items ||= YAML.load(File.read(ITEM_FILE))
        datetime = DateTime.now
        @date_time = datetime.strftime("%d/%m/%Y%H:%M")
        @user = user
    end

    def save_transaction(transaction_line)
        
        items_array = [transaction_line[1]]
        txn_hash = {
            transaction_line[0] => items_array
        }
        
        counter = 2 
        while counter < transaction_line.length do
            item_hash = {} 
            item_hash["name"] = transaction_line[counter]
            
            item_hash["quantity"] = transaction_line[counter+1]
            
            item_hash["rate"] = transaction_line[counter+2]
            
            item_hash["subtotal"] = transaction_line[counter+3]
            items_array.push(item_hash)
            counter += 4
        end
        file = File.open(TRANSACTION_FILE, "a")
        file.write(txn_hash.to_yaml.sub("---",""))
        file.close
    end

    def view_transaction(transaction_line)
        system("clear")
        puts "Transaction ID: #{transaction_line[0]}"
        puts "Entered by: #{transaction_line[1]}"
        p "Summary of Transaction:"
        p "       Item Name:       Quantity:       Rate:             Total:"
        
        counter = 2
        line_counter = 1        
        while counter < transaction_line.length do
            print "        #{transaction_line[counter]}"
            print "     "
            
            if ( line_counter % 4) == 0 
                puts " "
            end
            counter +=1
            line_counter += 1
        end
        puts ""
        puts "\n\n"
        puts "Would you like to save this transaction? (y/n)"
        option = gets.chomp.downcase
        if option == "y"
            save_transaction(transaction_line)
        else
            transaction_line = []
        end
    end

    def record_transactions(username)
        system("clear")
        puts "Welcome, you can add new transaction below."
        transaction_id = "txn"+@date_time
        transaction_line = []
        check = true

        puts "*************"
        puts "Date and Time: #{@date_time}"
        puts "User: #{@user}"
        puts "transaction ID: #{transaction_id}"
        puts "\n\nPlease enter transaction detail.\n"
        #puts Press F1 to get Item list with Item ID and quantity in hand. 
        print "Enter 111 to return to the main menu.\n"
        puts ""
         
        transaction_line << transaction_id
        transaction_line << username

        item_count = 1
        while check == true do
		    puts "Enter #{item_count} Item ID."
            item_key = gets.chomp
            if item_key.to_i == 111    
                # p transaction_line.inspect
                view_transaction(transaction_line)
                system("clear")
                break
            end
            puts "\nItem Name: #{@items[item_key.to_sym]["name"]}"
            get_item = @items[item_key.to_sym]["name"]
            transaction_line << @items[item_key.to_sym]["name"]
            # transaction_line << @items[item_key.to_sym]["price"]
            # puts get_item
            
            check_quantity = true

            while check_quantity == true do
                puts "Total quantity: "
                get_quantity = gets.chomp
                
                if get_quantity.to_i >= @items[item_key.to_sym]["quantity_on_hand"].to_i
                     puts "Not enough quantity. Quantity on hand for #{get_item} is #{@items[item_key.to_sym]["quantity_on_hand"]}"
                else
                    check_quantity = false
                    transaction_line << get_quantity
                    transaction_line << @items[item_key.to_sym]["price"]
                    transaction_line << (@items[item_key.to_sym]["price"].to_i * get_quantity.to_i)
                    # break
                end
            end    

            puts ""

            check = true
            item_count +=1
         end
         puts ""
         puts "Enter 111 to return to the main menu.\n"
         puts "Would you like to process for another customer? (y/n) "
         another_txn = gets.chomp

         if another_txn.downcase == "y"
            record_transactions(@user)
         else
            option_list(@user)
         end

    
    end

    def list_all_transaction
         system("clear")
        #  puts @transactions
        puts "Transaction summary: \n\n"
		 @transactions.each do |key,i|
              puts "Transaction ID: #{key}"
              puts "User Name: #{i[0]}"
              puts ""
              counter = 1  
              while counter < i.length do
		 	  puts "Item Name: #{i[counter]["name"]}"
              puts "Item Quantity: #{i[counter]["quantity"]}"
              puts "Item Rate: #{i[counter]["rate"]}"            
              puts "Item Subtotal: #{i[counter]["subtotal"]}"
		      counter +=1
              puts "--"
            end
            puts "==================="
         end 
    end

    def lookup_transaction
        system("clear")
        puts "Please enter Transaction ID:"
        transaction_id = gets.chomp
        data_array = @transactions[transaction_id]
        
        puts "\nUser Name: #{data_array[0]}"
        puts ""
        counter = 1  
        while counter < data_array.length do
        puts "Item Name: #{data_array[counter]["name"]}"
        puts "Item Quantity: #{data_array[counter]["quantity"]}"
        puts "Item Rate: #{data_array[counter]["rate"]}"
        puts "Item Subtotal: #{data_array[counter]["subtotal"]}"
        counter +=1
        puts "--"
        end
    end

end



# txn = Transaction.new("Santosh")
# txn.list_all_transaction
# txn.record_transactions
# txn.lookup_transaction