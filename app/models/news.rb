class News < ApplicationRecord
  validates :link, uniqueness: true
end
