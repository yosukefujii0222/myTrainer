class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text :body
      t.integer :follower_id
      t.timestamps
    end
  end
end
