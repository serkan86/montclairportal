# encoding: UTF-8
class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_forum
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]

  def index
    add_breadcrumb 'Topics', forum_topics_path(@forum)
    @search = @forum.topics.search(params[:q])
     @topics = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@topics)
  end

  def show
    add_breadcrumb @topic.name, forum_topic_path(@forum, @topic)
    respond_with(@topic)
  end

  def new
    add_breadcrumb 'New', new_forum_topic_path(@forum)
    @topic = Topic.new
    respond_with(@topic)
  end

  def edit
    add_breadcrumb @topic.id, topic_path(@topic)
    add_breadcrumb 'New', edit_forum_topic_path(@forum)
  end

  def create
    @topic = current_user.topics.new(topic_params)
    @topic.forum_id = @forum.id
    @topic.save
    respond_with(@forum, @topic)
  end

  def update
    @topic.update(topic_params)
    respond_with(@forum, @topic)
  end

  def destroy
    @topic.destroy
    respond_with(@forum, @topic)
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name)
  end

  def set_forum
    @forum = Forum.find(params[:forum_id])
    add_breadcrumb 'Forums', forums_path
    add_breadcrumb @forum.name, forum_path(@forum)
  end
end
