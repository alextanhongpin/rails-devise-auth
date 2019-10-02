class CreateProductTags < ActiveRecord::Migration[6.0]
  def self.up 
    create_table :product_tags do |t|
      t.references :taggable, polymorphic: true
      t.json :tags
      t.json :blacklisted_tags

      t.timestamps
      t.index [:taggable_id, :taggable_type], unique: true
    end
  end

  def self.down
    # To prevent rollback.
    # IrreversibleMigration
    drop_table :product_tags
  end
end
