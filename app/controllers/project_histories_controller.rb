class ProjectHistoriesController < ApplicationController
  before_action :set_project
  before_action :find_project_history, only: %i[edit update destroy]
  before_action :authorize_status_change, only: %i[change_status]

  def index
    @project_histories = @project.project_histories.includes(:user).order(created_at: :desc)
    @filter = params[:filter]
    @project_histories = @project_histories.filtered_by_type(@filter) if @filter.present?
    @project_histories = @project_histories.paginate(page: params[:page], per_page: 10)
  end

  def add_comment
    @project_history = @project.project_histories.new(project_history_params.merge(user: current_user, event_type: :comment))
    if @project_history.save
      respond_to do |format|
        format.html { redirect_to action: :index }
      end
    else
      redirect_to action: :index, alert: @project_history.errors.messages
    end
  end

  def change_status
    new_status = params[:content]
    if @project.update(status: new_status)
      @project_history = @project.project_histories.create(user: current_user, event_type: :status, content: new_status)
      redirect_to action: :index
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
    params.require(:project_history).permit(:content)
  end

  def find_project_history
    @project_history = @project.project_histories.find(params[:id])
  end

  def authorize_status_change
    authorize @project, :update_status? # authorization added through policy object for cleaner separation of concerns.
  end
end
