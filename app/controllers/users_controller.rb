class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    # @user = User.first

    @user = current_user
  end
end
