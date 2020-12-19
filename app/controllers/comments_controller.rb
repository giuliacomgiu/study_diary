class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

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
    @comment.destroy
    redirect_to @study_item
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
