class StudyItemsController < ApplicationController
  before_action :set_study_item, only: %i[show edit update complete destroy]

  def index
    @study_items = StudyItem.all
  end

  def new
    @study_item = StudyItem.new
  end

  def create
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

  def complete
    @study_item.update(completed_at: Time.current)
    redirect_to root_path
  end

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
                  :completed_at, :comments)
  end
end
