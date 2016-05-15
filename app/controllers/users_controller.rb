class UsersController < ApplicationController
	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to welcome_index_path
			SendMailsJob.perform_later @user.email
		else
			flash[:error] = @user.errors.full_messages.join(",")
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :confirm_password)
	end
end
