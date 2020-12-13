require 'date'

class StudyItemsController < ApplicationController
  def index
    @study_items = StudyItem.all
  end

  # to do: def new
  def new
    @study_item = StudyItem.new
  end

  def create
    @study_item = StudyItem.new(study_item_params)
    @study_item.save ? (redirect_to @study_item) : (render :new)
  end

  def show
    @study_item = StudyItem.find(params[:id])
  end

  def edit
    @study_item = StudyItem.find(params[:id])
  end

  def update
    @study_item = StudyItem.find(params[:id])
    byebug
    # params[:study_item][:status_updated_at] = DateTime.now unless params[:study_item][:status].nil?
    redirect_to root_path if @study_item.update(study_item_params)
  end

  def destroy
    StudyItem.delete(params[:id])
    redirect_to root_path
  end

  private

  def study_item_params
    params.require(:study_item)
          .permit(:title, :category, :deadline, :status, :status_updated_at)
  end
end
