class AddModifierToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :modifier, :string
  end
end
