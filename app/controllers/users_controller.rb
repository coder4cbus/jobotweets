class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.first
  end
end
