class ProjectPolicy < ApplicationPolicy
  def update_status?
    user.admin?  # Only admins can update status
  end

  def add_comment?
    user.present?  # Any logged-in user can comment
  end
end
