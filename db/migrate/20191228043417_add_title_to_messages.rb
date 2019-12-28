class AddTitleToMessages < ActiveRecord::Migration[5.2]
  def up
    add_column :messages, :title, :string
  end

  def down
    remove_column :messages, :title, :string
  end
end
