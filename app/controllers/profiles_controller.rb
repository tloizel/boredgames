class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    authorize @user

  end

end
