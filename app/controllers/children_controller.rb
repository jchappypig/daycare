class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to @child
    else
      render :new
    end
  end

  def show
    @child = Child.find(params[:id])
  end

  def index
    @children = Child.all
  end

  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(child_params)
      redirect_to @child
    else
      render :edit
    end
  end

  def edit
    @child  = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :dob)
  end
end
