class StudyItemsController < ApplicationController
  def index
    @study_items = StudyItem.all
  end

  def create
    StudyItem.create(title: params[:title],
                     category: params[:category],
                     description: params[:description],
                     deadline: params[:deadline],
                     status: false)
  end

  def show
    @study_item = StudyItem.find(params[:id])
  end

  def edit
    @study_item = StudyItem.find(params[:id])
  end
end
