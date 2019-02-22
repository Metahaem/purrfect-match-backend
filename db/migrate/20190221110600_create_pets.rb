class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :location
      t.integer :age
      t.string :breed
      t.string :link
      t.string :photo
      t.text :description
      t.boolean :live_with_cats, default: false
      t.boolean :live_with_dogs, default: false
      t.boolean :live_with_kids, default: false
      t.string :colour
      t.integer :home_id

      t.timestamps
    end
  end
end
