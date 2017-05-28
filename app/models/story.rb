class Story < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
end
