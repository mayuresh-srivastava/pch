require 'rails_helper'

describe ProjectHistoriesController, type: :controller do
  let(:user) { build_stubbed(:user) }
  let(:project) { build_stubbed(:project) }
  let(:project_history) { build_stubbed(:project_history, project: project, user: user) }

  before { sign_in user }

  it 'creates a project history entry' do
    post :create, params: { project_id: project.id, project_history: { content: 'Test comment', entry_type: 'comment' } }
    expect(response).to have_http_status(:created)
  end

  it 'updates a project history entry' do
    patch :update, params: { project_id: project.id, id: project_history.id, project_history: { content: 'Updated comment' } }
    expect(response).to redirect_to(project_project_histories_path(project))
  end

  it 'deletes a project history entry' do
    delete :destroy, params: { project_id: project.id, id: project_history.id }
    expect(response).to have_http_status(:no_content)
  end
end
