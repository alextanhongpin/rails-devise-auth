class ProductTag < ApplicationRecord
  belong_to :taggable, polymorphic: true
end
