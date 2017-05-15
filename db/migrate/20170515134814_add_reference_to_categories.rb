class AddReferenceToCategories < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :categories, :categories, column: :parent_id
  end
end
