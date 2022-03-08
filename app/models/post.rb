class Post < ApplicationRecord
  belongs_to :profile
  has_many :likes
  has_many :comments
end
