class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def new
    @categories = Category.all.map{|category| [category.name, category.id]}
    @story = Story.new
  end

  def create
    @story = Story.new story_params
    if @story.save
      redirect_to @story
    else
      @categories = Category.all.map{|category| [category.name, category.id]}
      render :new
    end
  end

  def show
    story = Story.find_by id: params[:id]
    if story
      render json: {story: story.as_json(include: :category)}
    else
      respond_to do |format|
        format.html{redirect_to categories_path}
        format.json{render status: :not_found}
      end
    end
  end

  private
  def story_params
    params.require(:story).permit :category_id, :title, :content
  end
end
