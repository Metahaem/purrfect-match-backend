class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :name
      t.string :password_digest
      t.boolean :user, default: true

      t.timestamps
    end
  end
end
