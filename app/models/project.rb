class Project < ApplicationRecord
  has_many :project_histories, dependent: :destroy

  enum status: { pending: 'Pending' }
end
