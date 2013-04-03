class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  class << self
    def find_for_google_apps(auth)
      user = find_or_initialize_by_email(auth["info"]["email"])
      user.name = auth["info"]["name"]
      user
    end
  end
end
