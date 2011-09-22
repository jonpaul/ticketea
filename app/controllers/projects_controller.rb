class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => 'Project has been created.'
    else
      render :new
    end
  end
end
