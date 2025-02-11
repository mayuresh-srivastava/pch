class Project < ApplicationRecord
  has_many :project_histories, dependent: :destroy

  enum status: { pending: 'Pending', in_progress: 'In Progress', completed: 'Completed' }
end
