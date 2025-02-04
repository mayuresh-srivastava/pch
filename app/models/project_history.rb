class ProjectHistory < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum event_type: { comment: 'Comment', status: 'Status' }
end
