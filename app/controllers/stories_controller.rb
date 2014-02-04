class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
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
      redirect_to @story.diary, notice: 'Story was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story.diary, notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @story.destroy
    redirect_to @story.diary
  end

  private
  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:content, :photo, :diary_id)
  end
end