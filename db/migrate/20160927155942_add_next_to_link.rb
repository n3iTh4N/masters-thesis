class AddNextToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :next, :integer
  end
end
