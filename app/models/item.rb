class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category
    validates :status
    validates :fee
    validates :area
    validates :arrival
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number'}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  with_options numericality: { greater_than: 1 } do
    validates :category
    validates :status
    validates :fee 
    validates :area
    validates :arrival
  end
end
