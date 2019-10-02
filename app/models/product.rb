class Product < ApplicationRecord
  has_many :product_tag, as: :taggable
end
