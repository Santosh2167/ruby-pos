require "yaml"
require_relative "helper_methods"
require_relative "user_profiles"


puts "\n\n\n      WELCOME TO Ezeee Pzeee POS System"
puts "      Designed and Developed by Theo and Santosh"
puts "\n\n\n\n"

puts "\n\nPlease enter your Username and Password"
print "Username: "
username = gets.chomp!
print "\nPassword: "
password = STDIN.noecho(&:gets).chomp
login(username, password)

option_list(username)

