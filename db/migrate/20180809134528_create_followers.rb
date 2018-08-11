class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.integer :trainer_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
