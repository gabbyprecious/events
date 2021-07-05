class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
