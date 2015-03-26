# encoding: UTF-8
class PostsController < ApplicationController
  before_action :set_forum, :set_topic
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]
  def index
    @search = @topic.posts.order('id DESC').search(params[:q])
    @posts = @search.result(:distinct => true).paginate(:page => params[:page])
    respond_with(@posts)
  end

  def show
    add_breadcrumb @post.id, forum_topic_post_path(@forum, @topic, @post)
    respond_with(@post)
  end

  def new
    add_breadcrumb 'New', new_forum_topic_post_path(@forum, @topic)
    @post = Post.new
    respond_with(@post)
  end

  def edit
    add_breadcrumb @post.id, forum_topic_post_path(@forum, @topic, @post)
    add_breadcrumb 'Edit', edit_forum_topic_post_path(@forum, @topic, @post)
  end

  def create
    @post = @topic.posts.new(post_params)
    @post.user_id = current_user.id
    @post.save
    respond_with(@forum, @topic, @post)
  end

  def update
    @post.update(post_params)
    respond_with(@forum, @topic, @post)
  end

  def destroy
    @post.destroy
    respond_with(@forum, @topic, @post)
  end

  private

  def set_post
    @post = @topic.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end


  def set_forum
    @forum = find_forum
    add_breadcrumb 'Forums', forums_path
    add_breadcrumb @forum.name, forum_path(@forum)
  end

  def set_topic
    @topic = find_topic
    add_breadcrumb 'Topics', forum_topics_path(@forum)
    add_breadcrumb @topic.name, forum_topic_path(@forum, @topic)
    add_breadcrumb 'Post', forum_topic_posts_path(@forum, @topic)
  end

  def find_forum
    Forum.find(params[:forum_id])
  end

  def find_topic
    @forum.topics.find(params[:topic_id])
  end
end
