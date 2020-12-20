class CommentsController < ApplicationController
  def create
    @study_item = StudyItem.find(params[:study_item_id])
    @comment = @study_item.comments.create(comment_params)
    redirect_to @study_item
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    byebug
    @study_item = StudyItem.find(params[:study_item_id])
    @comment = @study_item.comments.find(params[:id])
    redirect_to @study_item if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
