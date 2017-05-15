class CreateAdvertCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :advert_categories do |t|
      t.integer :advert_id
      t.integer :category_id

      t.timestamps
    end
  end
end
