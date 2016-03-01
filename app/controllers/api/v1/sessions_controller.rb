class Api::V1::SessionsController < Api::V1::BaseController
	def create
		user = User.find_by(email: create_params[:email])
		p user
		p "========"
		if user && user.authenticate(create_params[:password])
			self.current_user = user
			@user = Api::V1::SessionSerializer.new(user, root: false)

			respond_to do |format|
				format.json { render json: @user }
			end


		else
			return api_error(status: 401)
		end
	end

	private
	def create_params
		params.require(:user).permit(:email, :password)
	end
end
