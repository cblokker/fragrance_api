class Fragrance < ApplicationRecord
  validates_presence_of :name, :category

  # NOTE: Category could be ENUM
end
