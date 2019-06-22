class ProfileController < ApplicationController

  def index
    authorize! :index, User
    @user = User.find(current_user.id)
  end

end
