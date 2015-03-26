class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    add_breadcrumb @user.name, user_path(@user)
    @blogs = @user.blogs.order('id DESC').paginate(page: params[:page])
  end
end