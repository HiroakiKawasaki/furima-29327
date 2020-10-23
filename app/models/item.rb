class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :arrival

  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :area_id
    validates :arrival_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { greater_than: 1 } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :area_id
    validates :arrival_id
  end
end
