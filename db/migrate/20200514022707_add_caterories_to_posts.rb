class AddCateroriesToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :categories, :text
  end
end
