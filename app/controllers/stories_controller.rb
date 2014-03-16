class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    date = params[:date]
    if date.blank?
      @stories = Story.all
    else
      @stories = Story.find_by_date(Date.parse(date))
    end
  end

  def show
  end

  def new
    @story = Story.new
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url
  end

  private
  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:content, :photos)
  end
end
