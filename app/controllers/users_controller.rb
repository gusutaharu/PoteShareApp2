class UsersController < ApplicationController
  
  def account
    
  end
  
  def profile
    @user = User.find(current_user.id)
  end
  
  def profile_update
    @user = User.find(current_user.id)
    if @user.update(user_params)
    redirect_to '/users/profile'
    else
      render 'users/profile'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name,:icon_img,:introduction)
    end
  
end