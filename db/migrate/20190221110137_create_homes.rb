class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.integer :user_id
      t.boolean :external, default: false

      t.timestamps
    end
  end
end
