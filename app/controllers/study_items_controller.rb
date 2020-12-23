class StudyItemsController < ApplicationController
  before_action :set_study_item, only: %i[show edit update complete destroy]

  def index
    @study_items = StudyItem.order(:title)
  end

  def new
    @study_item = StudyItem.new
    @categories = Category.all
    @types = Type.all
  end

  def create
    @study_item = StudyItem.new(study_item_params)
    if @study_item.save
      redirect_to @study_item
    else
      render :new
    end
  end

  def show; end

  def edit
    @categories = Category.all
    @types = Type.all
  end

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

  def search
    # NOTE: from guide:The find_each and find_in_batches methods
    # are intended for use in the batch processing of a large number of records
    # that wouldn't fit in memory all at once. If you just need to loop over
    # a thousand records the regular find methods are the preferred option.

    query_params = "%#{params[:query]}%"
    @study_items = StudyItem.where("title LIKE ? or
                                   description LIKE ?",
                                   query_params, query_params)
  end

  def sort_by
    # safety flaw?
    @study_items = StudyItem.order(params[:sort_by])
    render :index
  end

  private

  def set_study_item
    @study_item = StudyItem.find(params[:id])
  end

  def study_item_params
    params.require(:study_item)
          .permit(:title, :description, :deadline,
                  :completed_at, :comments,
                  :type_id, category_ids: [])
  end
end
