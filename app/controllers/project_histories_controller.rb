class ProjectHistoriesController < ApplicationController
  before_action :set_project
  before_action :find_project_history, only: %i[edit update destroy]

  def index
    @project_histories = @project.project_histories.includes(:user).order(created_at: :desc)
    @filter = params[:filter]
    @project_histories = @project_histories.filtered_by_type(@filter) if @filter.present?
  end

  def create
    @project_history = @project.project_histories.new(project_history_params)
    @project_history.user = current_user
    if @project_history.save
      respond_to do |format|
        format.html { redirect_to action: :index }
      end
    else
      redirect_to action: :index, alert: @project_history.errors.messages
    end
  end

  def update
    if @project_history.user == current_user && @project_history.update(project_history_params)
      redirect_to action: :index
    else
      redirect_to action: :index, alert: @project_history.errors.messages
    end
  end

  def destroy
    @project_history = @project.project_histories.find(params[:id])
    if @project_history.user == current_user && @project_history.destroy
      redirect_to action: :index
    else
      redirect_to action: :index, alert: @project_history.errors.messages
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def project_history_params
    params.require(:project_history).permit(:event_type, :content)
  end

  def find_project_history
    @project_history = @project.project_histories.find(params[:id])
  end
end
