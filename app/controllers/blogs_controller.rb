# encoding: UTF-8
class BlogsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :index]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumb, only: [:edit, :show, :index]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]


  def index
    if params[:user_id].present?
      @search = @user.blogs.order('id DESC').search(params[:q])
    else
      @search = Blog.order('id DESC').search(params[:q])
    end
    @blogs = @search.result(:distinct => true).paginate(:page => params[:page])
    respond_with(@blogs)
  end

  def show
    add_breadcrumb @blog.title, user_blog_path(@user, @blog)
    respond_with(@blog)
  end

  def new
    #add_breadcrumb current_user.name, user_path(current_user)
    add_breadcrumb t('tooltips.new'), new_blog_path
    @blog = Blog.new
    respond_with(@blog)
  end

  def edit
    add_breadcrumb @blog.id, blog_path(@blog)
    add_breadcrumb t('tooltips.edit'), edit_blog_path
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    @blog.save
    respond_with(current_user, @blog)
  end

  def update
    @blog = current_user.blogs.friendly.find(params[:id])
    @blog.update(blog_params)
    respond_with(current_user, @blog)
  end

  def destroy
    @blog = current_user.blogs.friendly.find(params[:id])
    @blog.destroy
    respond_with(current_user, @blog)
  end

  private

  def set_user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
  end

  def set_blog
    if @user.present?
      @blog = @user.blogs.friendly.find(params[:id])
    else
      @blog = Blog.friendly.find(params[:id])
    end
  end

  def set_breadcrumb
    if @user.present?
      add_breadcrumb @user.name, user_path(@user)
      add_breadcrumb 'Blogs', user_blogs_path(@user)
    else
      add_breadcrumb 'Blogs', blogs_path
    end
  end

  def blog_params
    params.require(:blog).permit(:content, :title, :user)
  end
end
