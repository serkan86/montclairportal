class FolloweesController < ApplicationController

  def index
    user = User.find_by username: params[:user_id]
    @followees = user.followees(User)
    @feeds = Feed.includes(:user).where('user_id IN(?)', user.followees(User).map(&:id)).order('id DESC').paginate(page: params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @candidate = User.find(params[:user])

    if @candidate == current_user
      return
    end

    @follow = @current_user.follow!(@candidate)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @candidate = User.find(params[:id])

    @follow = current_user.unfollow!(@candidate)

    respond_to do |format|
      format.js
    end
  end
end