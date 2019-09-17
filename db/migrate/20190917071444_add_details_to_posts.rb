class AddDetailsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :count, :integer
    add_column :posts, :body, :text
  end
end
