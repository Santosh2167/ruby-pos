require 'yaml'

class Item
	ITEMS_FILE = "items.yml"
	
	def initialize 
		@items ||= YAML.load(File.read(ITEMS_FILE))
	end
	#***********
	#this method adds items to the file
	#***********
	def add_item 
		
		puts "Welcome, you can add new item below."
		item_key = ""
		item = {}

		puts "Enter product key: "
		item_key = gets.chomp

		puts "Enter product name: "
		item["name"] = gets.chomp

		puts "Enter product price($): "
		item["price"] = gets.chomp

		puts "Enter product margin($): "
		item["margin"] = gets.chomp


		puts "Enter quantity on hand: "
		item["quantity_on_hand"] = gets.chomp
	
		file = File.open(ITEMS_FILE, "a")
        file.write({item_key.to_sym => item}.to_yaml.sub("---",""))
        file.close
	
	end

	#***********
	#this method looks up items on the file and present to the user
	#***********

	def look_up_items
		puts "Please enter item key: "
		item_key = gets.chomp
		puts "************************"
		puts "\nFollowing is the item detail:\n"
		puts "Item Name: #{@items[item_key.to_sym]["name"]}"
		puts "Item Price($): #{@items[item_key.to_sym]["price"]}"
		puts "Item Margin($): #{@items[item_key.to_sym]["margin"]}"
		puts "Quantity on hand: #{@items[item_key.to_sym]["quantity_on_hand"]}"
		puts "\n"
		#puts @items["name"]
	end

	#***********
	#this method lists all items
	#***********

	def list_all_items
		system("clear")
		@items.each do |key,i|
			puts "item key: #{key}"
			puts "Item Name: #{i["name"]}"
			puts "Item Price: #{i["price"]}"
			puts "Item Margin: #{i["margin"]}"
			puts "Quantity in hand: #{i["quantity_on_hand"]}"
			puts ""
		end 

	end

end



clear_screen = %x{clear}
puts clear_screen
puts "lets Start"
item = Item.new
puts "calling the add_item"
item.look_up_items


# class Item
# 	ITEMS_FILE = "items.yml"

# 	def initialize
# 		@items ||= YAML.load(File.read(ITEMS_FILE))
# 	end

# 	def create_item
# 		item_key = ""
# 		item = {}

# 		p "Enter Product Key"
# 		item_key = gets.chomp
		
# 		p "Enter Product name"
# 		item["name"] = gets.chomp
		
# 		p "Enter Product price"
# 		item["price"] = gets.chomp
		
# 		p "Enter Product margin"
# 		item["margin"] = gets.chomp
		
# 		p "Enter Product quantity_in_hand"
# 		item["quantity_in_hand"] = gets.chomp

# 		file = File.open(ITEMS_FILE, "a")
# 		file.write({item_key.to_sym => item}.to_yaml.sub("---",""))
# 		file.close
# 	end

# 	def look_item(item_key)
# 		@items[item_key.to_sym]
# 	end

# 	def list_all_items
# 		@items.each do |key,i|
# 			p key
# 			p i["name"]
# 			p i["price"]
# 			p i["margin"]
# 			p i["quantity_in_hand"]
# 			p ""
# 		end
# 	end

# end

# i = Item.new
# i.list_all_items
# i.look_item("tp")
# i.create_item