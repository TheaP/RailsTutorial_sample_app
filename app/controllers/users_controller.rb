class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end

  def new
	  @user = User.new
  end

  def create
	  @user = User.new(user_params)	# Note the use of user_params, not params[:user]
	  if @user.save
		  sign_in @user
		  flash[:success] = "Welcome to Neonate Connect!"
		  redirect_to @user
	  else
		  render 'new'
	  end
  end

  # Using strong paramters in the create action.  (See Listing 7.22)
  private

  def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
