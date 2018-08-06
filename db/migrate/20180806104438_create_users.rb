class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :idealWeight
      t.string :gender
      t.string :height
      t.string :weight
      t.string :age
      t.timestamps
    end
  end
end
