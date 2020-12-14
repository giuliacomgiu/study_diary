class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @study_item = StudyItem.find(params[:study_item_id])
    @comment = @study_item.comments.create(comment_params)
    redirect_to @study_item
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @study_item = StudyItem.find(params[:study_item_id])
    @comment = @study_item.comments.find(comment_params)
    byebug
    @comment.destroy
    redirect_to @study_item
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:comment)
  end
end
