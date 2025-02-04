class AddUserToProjectHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :project_histories, :user, null: false, foreign_key: true
  end
end
