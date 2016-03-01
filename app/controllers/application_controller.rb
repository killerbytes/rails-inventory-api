class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	config.relative_url_root = ""

	def default_serializer_options
		{root: false}
	end
end
