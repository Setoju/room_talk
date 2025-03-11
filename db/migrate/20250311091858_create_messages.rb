class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :room, null: false, foreign_key: true
      t.string :user_name, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
