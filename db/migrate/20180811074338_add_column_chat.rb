class AddColumnChat < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :sender, :integer
  end
end
