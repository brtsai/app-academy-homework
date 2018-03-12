class UsersController < ApplicationController
  before_action :ensure_is_current_users_page!, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in_user!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end
 
  #TODO implement edit and update
  def edit
    
  end

  def update

  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to :new
    end
    render :show
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def ensure_is_current_users_page!
    unless current_user_matches_id?(params[:id].to_i)
      flash[:errors] = ["That wasn't your user page, this is."]
      redirect_to user_url(current_user.id)
    end
  end
end
