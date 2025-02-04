class ProjectHistory < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum event_type: { comment: 'comment', status: 'status' }

  validates :content, presence: true

  scope :filtered_by_type, -> (filter) { where(event_type: filter) }
end
