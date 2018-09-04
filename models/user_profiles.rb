require "yaml"

class User
  attr_reader :users
  USERS_FILE = "./db_files/user_profiles.yml"

  def initialize
    @users ||= YAML.load(File.read(USERS_FILE))
  end

  def lookup_user_profile(user_key)
    @users[user_key.to_sym]
  end

  def user_exist?(username)
    lookup_user_profile(username)["username"] == username
  rescue
    false
  end

  def password_match?(username, password)
    lookup_user_profile(username)["username"] == username && lookup_user_profile(username)["password"] == password
  rescue
    false
  end

  def list_all_users
    @users.each do |key, i|
      p key
      p i["primay_key"]
      p i["fullname"]
      p i["username"]
      p i["password"]
      p i["position"]
      p i["permission_level"]
      p i["active"]
      p "-----------"
    end
  end
end

# # TESTS
# users = User.new
# users.list_all_users
# p users.lookup_user_profile # returns a hash of a user
# p users.user_exist?("azane")
# p users.password_match?("azane", "password1")

#   def create_user
#     file = File.open(USERS_FILE, "a")
#     file.write({primary_key.to_sym => user}.to_yaml.sub("---", ""))
#     file.close
#   end
