class AddProgressToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :progress, :integer
  end
end
