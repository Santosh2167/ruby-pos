require 'yaml'

class Item
	ITEMS_FILE = "items.yml"
	
	def initialize 
		@items ||= YAML.load(File.read(ITEMS_FILE))
	end

	def add_item
		puts "in add_item method"
	end

end



clear_screen = %x{clear}
puts clear_screen
puts "lets Start"
item = Item.new
puts "calling the add_item"
item.add_item


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