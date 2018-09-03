
require 'yaml'

def read_from_file(file_name)
	items = YAML.load_file(file_name)
	items.each do |k, v|
	 p k
	 p v["name"]
	 p v["price"]
	 p v["margin"]
	 p v["quantity_in_hand"]
	 p ""
	end
end




read_from_file("items.yml")

file = File.open("items.yml", "a")
new_item = {:mw=>{:name=>"mouth wash", :price=>5, :marign=>1, :quantity_in_hand=>30}}
file.write(new_item.to_yaml)
file.close

read_from_file("items.yml")



