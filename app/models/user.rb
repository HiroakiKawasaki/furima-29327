class User < ApplicationRecord
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,100}+\z/i,message: '英字と数字の両方を含めて設定してください'}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } 
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } 
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' } 
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' } 
  validates :birthday, presence: true

  
end
