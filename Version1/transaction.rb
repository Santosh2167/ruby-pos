require "yaml"
require "date"

class Transaction
    
    TRANSACTION_FILE = "transactions.yml"
    ITEM_FILE = "items.yml"   

    def initialize user
        @transactions ||= YAML.load(File.read(TRANSACTION_FILE))
        @items ||= YAML.load(File.read(ITEM_FILE))
        datetime = DateTime.now
        @date_time = datetime.strftime("%d/%m/%Y %H:%M")
        @user = user
    end

    def save_transaction(transaction_line)
        puts "saving method"
        # transaction_line.each {|items| p items }
    end

    def view_transaction(transaction_line)
        system("clear")
        puts "Transaction ID: #{transaction_line[0]}"
        puts "Entered by: #{transaction_line[1]}"
        p "Summary of Transaction:"
        p "       Item Name:       Quantity:       Rate:             Total:"
        
        counter = 2
        line_counter = 1        
        while counter<transaction_line.length do
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

    def record_transactions
        system("clear")
        transaction_id = "txn"+@date_time
        transaction_line = []
        check = true

        puts "*************"
        puts "Date and Time: #{@date_time}"
        puts "User: #{@user}"
        puts "transaction ID: #{transaction_id}"
        puts "\n\nPlease enter transaction detail.\n\n"
        transaction_line << transaction_id
        transaction_line << "Santosh"

        item_count = 1
        print "Press F1 to get Item list with Item ID and quantity in hand. Press Esc to exit.\n"
        puts ""
         
        while check == true do
		    puts "Enter #{item_count} Item ID."
            item_key = gets.chomp
            if item_key.to_i == 200    
                # p transaction_line.inspect
                view_transaction(transaction_line)
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


        #puts "Item Name: #{@items[item_key.to_sym]["name"]}"

		# puts "Enter the quantity: "
		# item["name"] = gets.chomp
        

    end

end

txn = Transaction.new("Santosh")

txn.record_transactions