class UserParameterSanitizer < Devise::ParameterSanitizer
	def sign_up
		default_params.permit(:name, :last_name, :email, :password, :password_confirmation)
	end

	def account_update
		default_params.permit(:name, :last_name, :email, :password, :password_confirmation, :current_password)	
	end
end