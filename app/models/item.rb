class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category, numericality: { greater_than: 1 }
    validates :status, numericality: { greater_than: 1 }
    validates :fee , numericality: { greater_than: 1 }
    validates :area, numericality: { greater_than: 1 }
    validates :arrival, numericality: { greater_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number'}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  end
end
