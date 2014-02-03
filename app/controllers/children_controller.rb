class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update]

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to @child, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def index
    @children = Child.all
  end

  def update
    set_child
    if @child.update_attributes(child_params)
      redirect_to @child, notice: 'Child was successfully updated'
    else
      render :edit
    end
  end

  def edit
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :dob)
  end
end
