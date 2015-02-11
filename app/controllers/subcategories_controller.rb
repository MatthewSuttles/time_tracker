class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)

    if @subcategory.save
      flash[:notice] = "Subcategory Saved"
      redirect_to edit_subcategory_url(@subcategory)
    else
      render :new
    end
  end

  def update
    @subcategory = Subcategory.find(params[:id])

    if @subcategory.update_attributes(subcategory_params)
      flash[:notice] = "Subcategory Saved"
      redirect_to edit_subcategory_url(@subcategory)
    else
      render :edit
    end
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end



  private

  def subcategory_params
    params[:subcategory].permit(:name, :description, :active, :category_id)
  end
end
