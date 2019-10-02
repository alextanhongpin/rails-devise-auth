class ProductTag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
end
