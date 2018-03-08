class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    # @user = User.first
     @tweets = Tweet.where(user_id: current_user.following.push(current_user.id))
    @user = current_user
  end

  def all
    @users = User.all
  end

  def show
    @user = User.find(params['id'])
    @tweets = user.tweets
    render 'profile'
  end

  def follow
    puts "[DBG] params id is#{params['id']}"
    unless current_user.following.include?(params['id'])
      puts "[DBG] params in#{params['id']} to following"
      current_user.following.push(params['id'])
      # below another way of writing same thing appears above
      # current_user.following << (params['id'])
      current_user.save
    end
    puts "[DBG] current_user.following is #{current_user.following}"
    redirect_to user_url(params['id'])
  end

  def unfollow
    current_user.following.delete(params['id'])
    current_user.save!
    redirect_to user_url(params['id'])

  end
end
