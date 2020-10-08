require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
    end

    describe '商品の出品' do

      context '商品出品がうまくいくとき' do
        it "出品画像と商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば登録できる" do
          expect(@item).to be_valid
        end
        it "販売価格が半角英数字であれば登録できる" do
          @item.price = 500
          expect(@item).to be_valid
        end
        it "販売価格が300円以上9,999,999円以下であれば登録できる" do
          @item.price = 500
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it "商品名が空だと登録できない" do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明が空だと登録できない" do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it "カテゴリー欄が『--』だと登録できない" do
          @item.category = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be greater than 1")
        end
        it "商品の状態欄が『--』だと登録できない" do
          @item.status = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be greater than 1")
        end
        it "配送料の負担欄が『--』だと登録できない" do
          @item.fee = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Fee must be greater than 1")
        end
        it "発送元の地域欄が『--』だと登録できない" do
          @item.area = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be greater than 1")
        end
        it "発送までの日数欄が『--』だと登録できない" do
          @item.arrival = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Arrival must be greater than 1")
        end
        it "価格が空だと登録できない" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "出品画像が空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "価格が299円以下だと登録できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "価格が10,000,000円以上だと登録できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it "価格が全角だと登録できない" do
          @item.price = "５００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end

