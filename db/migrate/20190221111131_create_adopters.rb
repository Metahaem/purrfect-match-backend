class CreateAdopters < ActiveRecord::Migration[5.2]
  def change
    create_table :adopters do |t|
      t.string :name
      t.string :password_digest
      t.string :location
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
