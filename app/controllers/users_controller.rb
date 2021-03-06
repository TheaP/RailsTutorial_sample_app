class UsersController < ApplicationController
	before_action :signed_in_user, 	only: [:edit, :update, :index]
	before_action :correct_user, 	only: [:edit, :update]
	before_action :admin_user, 	only: :destroy
	
	def show
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page])
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

    def edit
  end

    def index
	    @users = User.paginate(page: params[:page])
    end

    def update
	    if @user.update_attributes(user_params)
		    # Handle a successful update.
		    flash[:success] = "Profile updated"
		    redirect_to @user
	    else
		    render 'edit'
	    end
    end

    def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted."
	    redirect_to users_url
    end

  # Using strong paramters in the create action.  (See Listing 7.22)
  private

  def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Before filters

  def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_url) unless current_user?(@user)
  end
  
  def admin_user
	  redirect_to(root_url) unless current_user.admin?
  end
end
