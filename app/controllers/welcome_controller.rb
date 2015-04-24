class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def wall
    @activities = PublicActivity::Activity.where('owner_id != ?', current_user.id).order('created_at DESC').paginate(page: params[:page])
  end
end