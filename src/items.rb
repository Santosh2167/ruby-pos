require "yaml"
require_relative "helper_methods"

class Item
  ITEMS_FILE = "items.yml"

  def initialize(username)
    @items ||= YAML.load(File.read(ITEMS_FILE))
    @username = username
  end

  #***********
  #this method adds items to the file
  #***********
  def add_item
    system("clear")
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
    file.write({item_key.to_sym => item}.to_yaml.sub("---", ""))
    file.close

    puts "Would you like to add another product? (y/n)"
    option = gets.chomp

    if option.downcase == "y"
      add_item
    else
      system("clear")
    end
  end

  #***********
  #this method looks up items on the file and present to the user
  #***********

  def look_up_item
    puts "Welcome, this section helps you to search item by its code. If you do not know the code, please go to Report > View All Items section."
    puts "Please enter item ID for the item you want to search: "
    puts "\n"
    item_key = gets.chomp
    puts "************************"
    puts "\n"
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
    @items.each do |key, i|
      puts "item key: #{key}"
      puts "Item Name: #{i["name"]}"
      puts "Item Price: #{i["price"]}"
      puts "Item Margin: #{i["margin"]}"
      puts "Quantity in hand: #{i["quantity_on_hand"]}"
      puts ""
    end
  end

  def edit_item
    puts "Welcome, this section helps you to edit the existing items by entering product ID. If you are not sure of the product ID then visit Report > List All Items."
    puts ""
    puts "Enter ID of the product you want to edit:"
    item_id = gets.chomp

    puts ""
    puts "Please type the field you want to modify. Fields are name, price, rate, quantity_on_hand"
    puts "please make sure you get the spelling correct for the field you enter!!!"
    field = gets.chomp

    puts ""
    puts "Please enter new value for the field typed."
    new_value = gets.chomp

    item = @items[item_id.to_sym]
    item[field.to_s] = new_value
    File.open(ITEMS_FILE, "w").write(@items.to_yaml)

    puts "Item modified!!!"
    puts ""

    puts "Do you want to modify another item?(y/n)"
    check_option = gets.chomp

    if check_option.downcase == "y"
      system("clear")
      edit_item
    else
      system("clear")
    end
  end
end
