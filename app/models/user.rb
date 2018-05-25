class User < ApplicationRecord
	
	before_create :generate_authentication_token!
	validates :auth_token, uniqueness: true
	validates_confirmation_of :password 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

