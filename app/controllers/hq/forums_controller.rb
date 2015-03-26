# encoding: UTF-8
class Hq::ForumsController < Hq::ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  add_breadcrumb 'Forum', :hq_forums_path
  def index
    @search = Forum.search(params[:q])
     @forums = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@forums)
  end

  def show
    add_breadcrumb @forum.name, hq_forum_path(@forum)
    respond_with(@forum)
  end

  def new
    add_breadcrumb 'New', new_hq_forum_path
    @forum = Forum.new
    respond_with(@forum)
  end

  def edit
    add_breadcrumb @forum.id, hq_forum_path(@forum)
    add_breadcrumb 'Edit', edit_hq_forum_path
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.save
    respond_with(:hq, @forum)
  end

  def update
    @forum.update(forum_params)
    respond_with(:hq, @forum)
  end

  def destroy
    @forum.destroy
    respond_with(:hq, @forum)
  end

  private

  def set_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:description, :name)
  end
end
