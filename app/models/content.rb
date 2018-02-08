class Content < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :prefecture_id, presence: true
  validates :image, presence: true
end
