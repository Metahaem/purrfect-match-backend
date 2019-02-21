class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :adopter_id
      t.integer :pet_id

      t.timestamps
    end
  end
end
