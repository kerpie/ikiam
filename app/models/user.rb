class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :captures

  def safe_name
  	if name.nil? || name.empty? 
  		email
  	else
  		if last_name.nil? || last_name.empty?
  			name
  		else
  			name + last_name
  		end
  	end
  end
end
