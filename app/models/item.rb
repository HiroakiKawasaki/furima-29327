class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,     presence: true
  validates :price,    presence: true, format: { with: /\A[0-9]+\z/}
  validates :category, presence: true
  validates :status,   presence: true
  validates :fee,      presence: true
  validates :area,     presence: true
  validates :arrival, presence: true
end
