class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,            presence: true
  validates :price,           presence: true, format: { with: /\A[0-9]+\z/}
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :delivery_fee_id, presence: true
  validates :area_id,         presence: true
  validates :date_id,         presence: true
end
