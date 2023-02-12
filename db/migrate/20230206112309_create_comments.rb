class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :user_id, null: false
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
