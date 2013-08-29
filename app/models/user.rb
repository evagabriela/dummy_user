class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.authenticate(email,password)
    User.where(:email => email, :password => password).first
  end
end
