class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json{render json: {categories: @categories}}
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
    category = Category.find_by id: params[:id]
    if category
      render json: {category: category.as_json(include: :stories)}
    else
      respond_to do |format|
        format.html{redirect_to categories_path}
        format.json{render status: :not_found}
      end
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
