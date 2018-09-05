require "yaml"

class User
  attr_reader :users
  USERS_FILE = "./user_profiles.yml"

  def initialize
    @users ||= YAML.load(File.read(USERS_FILE))
  end

  def lookup_user_profile(user_key)
    @users[user_key.to_sym]
  end

  def user_password_match?(username, password)
    lookup_user_profile(username)["password"] == password
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

### TESTS ###
# user = User.new
# user.list_all_users
# p user.lookup_user_profile("azane") # returns a hash of a user details
# p user.user_password_match?("azane", "passworda")