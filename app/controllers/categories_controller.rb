class CategoriesController < ApplicationController 

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  # do I need to add things here?
  
end
