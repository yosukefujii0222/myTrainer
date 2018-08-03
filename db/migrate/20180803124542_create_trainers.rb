class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :speciality
      t.string :gender
      t.string :height
      t.string :weight
      t.string :age
      t.text :career
      t.timestamps
    end
  end
end
