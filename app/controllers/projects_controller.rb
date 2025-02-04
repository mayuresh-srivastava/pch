class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
