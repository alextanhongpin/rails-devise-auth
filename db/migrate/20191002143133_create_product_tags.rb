class CreateProductTags < ActiveRecord::Migration[6.0]
  def change
    create_table :product_tags do |t|
      t.references :taggable, polymorphic: true
      t.json :tags
      t.json :blacklisted_tags

      t.timestamps
      t.index [:taggable_id, :taggable_type]
    end
  end
end
