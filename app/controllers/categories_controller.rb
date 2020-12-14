class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save ? (redirect_to categories_path) : (render :new)
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    redirect_to categories_path if @category.update(category_params)
  end

  def destroy
    Category.delete(params[:id])
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
