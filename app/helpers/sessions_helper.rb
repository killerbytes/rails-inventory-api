module SessionsHelper
	# Returns true if the given user is the current user.
	def current_user?(user)
		user == current_user
	end

	def current_user?(user)
		user == current_user
	end
	# Returns the current logged-in user (if any).
	def current_user
		p "========="
		p session[:user_id]
		p "========="
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(:remember, cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end

end
