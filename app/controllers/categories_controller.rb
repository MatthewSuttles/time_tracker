class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories

  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    redirect_to edit_category_url(@category)
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to edit_category_url(@category)
  end

  def new
    @category = Category.new
  end

  private
  def category_params
    params[:category].permit(:name, :description)
    end
end
