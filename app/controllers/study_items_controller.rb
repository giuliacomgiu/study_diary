require 'date'

class StudyItemsController < ApplicationController
  before_action :set_study_item, only: %i[show edit update destroy]

  def index
    @study_items = StudyItem.all
  end

  def new
    @study_item = StudyItem.new
  end

  def create
    byebug
    @study_item = StudyItem.new(study_item_params)
    @study_item.category = Category.find(params[:category][:id])
    if @study_item.save
      redirect_to @study_item
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    params[:study_item][:status_updated_at] = DateTime.now unless params[:study_item][:status].nil?
    if @study_item.update(study_item_params)
      redirect_to study_item_path(@study_item)
    else
      render :edit
    end
  end

  def destroy
    @study_item.destroy
    redirect_to root_path
  end

  # to do: overwrite category method
  # def category
  #  category.title
  # end

  private

  def set_study_item
    @study_item = StudyItem.find(params[:id])
  end

  def category_params
    params.require(:category)
          .permit(:id)
  end

  def study_item_params
    params.require(:study_item)
          .permit(:title, :description, :deadline,
                  :status, :status_updated_at, :comments)
  end
end
