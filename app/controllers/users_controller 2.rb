class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:index, :show, :edit, :update]
	before_action :ensure_correct_user, only:[:edit, :update]
		def ensure_correct_user
			if current_user.id != params[:id].to_i
				redirect_to user_path(current_user)
			end
		end

	def home
	end

	def about
	end

	def follow
		@user = User.find(params[:id])
	end

	def follower
		@user = User.find(params[:id])
	end

	def index
		@user = User.find(current_user.id)
		@book_new = Book.new
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@book_new = Book.new
		@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
       		flash[:notice] = "You have updated user successfully."
			redirect_to user_path(@user)
		else
			render ("users/edit")
		end
	end

	protected
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
