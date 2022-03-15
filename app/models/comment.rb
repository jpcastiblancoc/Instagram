class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :profile
  broadcasts_to :post
end
