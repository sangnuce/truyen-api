class Category < ApplicationRecord
  has_many :stories, dependent: :destroy
end
