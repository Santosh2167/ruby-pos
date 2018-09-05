require "yaml"
require "io/console"
require_relative "helper_methods"
require_relative "user_profiles"

system("clear")
puts "\n\n\n      Welcome to GET ME THE MONEY!!! POS System"
puts "      Designed and Developed by Theo and Santosh"
puts "\n\n"

puts "\n\nPlease enter your Username and Password"
print "Username: "
username = gets.chomp!
print "\nPassword: "
password = STDIN.noecho(&:gets).chomp
login(username, password)
