class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Set default attr's #####
    # GLOBE
    globe = Globe.new(
      lat: 0.924206230200376,
      lng: -34.2400771379471,
      zoom: 5
    )
    @user.globe = globe
    @user.description = "hello, my name is #{@user.first_name}, and I like to ..."


    if @user.save
      @user.send_activation_email
      flash[:info] = "welcome to driftMaps"
      log_in @user

      globe = Globe.new(
        lat: 0.924206230200376,
        lng: -34.2400771379471,
        zoom: 5
      )

      @user.globe = globe
      @user.save

      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Save successful."
    else
      flash[:danger] = "whoops! something went wrong, please try again."
    end

    redirect_to @user
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted successfully"
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :description,
      :password,
      :password_confirmation,
      :profile_pic,
      :home_country,
      :home_state,
      :home_city,
      :current_country,
      :current_state,
      :current_city
    )
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])

    if current_user?(@user) || current_user.admin?
      return true
    else
      flash[:danger] = "You do not have permission to do that!"
      redirect_to(root_path)
    end
  end
end

