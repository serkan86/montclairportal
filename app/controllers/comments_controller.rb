class CommentsController < ApplicationController
  include AbleHelperController

  def index
    @able = able
    @comments = able.comments.includes(:user).order('comments.id DESC').paginate(page: params[:page])
  end

  def create
    @comment = able.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def new
    @comment = able.comments.new
  end

  def destroy
    @comment = Comment.where(user_id: current_user.id).find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = able.comments.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        # format.html { redirect_to @attachment, notice: 'Post was successfully updated.' }
        format.json { head :no_content } # 204 No Content
      else
        # format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end