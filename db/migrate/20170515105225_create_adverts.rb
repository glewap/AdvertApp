class CreateAdverts < ActiveRecord::Migration[5.1]
  def change
    create_table :adverts do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :author_id
      t.boolean :active

      t.timestamps
    end
  end
end
