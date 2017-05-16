class AddReferenceToAdvert < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :adverts, :users, column: :user_id
  end
end
