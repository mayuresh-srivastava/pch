class ProjectPolicy < ApplicationPolicy
  # Just added as example, but can be added based on requirements e.g. if status and comment addition being used separately
  def update_status?
    user.admin?  # Only admins can update status
  end

  def add_comment?
    user.present?  # Any logged-in user can comment
  end
end
