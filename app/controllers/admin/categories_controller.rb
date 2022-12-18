class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.auth[:username], password: Rails.configuration.auth[:password]
  
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end