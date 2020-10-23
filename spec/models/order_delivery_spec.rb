require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品の購入機能' do
    before do
      @order_delivery = FactoryBot.build(:order_delivery)
    end

    context '商品の購入がうまくいくとき' do
      it "token、郵便番号、都道府県、市区町村、番地、電話番号があれば保存ができる" do
        expect(@order_delivery).to be_valid
      end
      it "郵便番号にハイフンが必要であること(123-4567となる)" do
        @order_delivery.post = "123-4567"
        expect(@order_delivery).to be_valid
      end
      it "電話番号にはハイフン不要で11桁以内であること" do
        @order_delivery.phone_number = "08012345678"
        expect(@order_delivery).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it "Tokenが空では登録できない" do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では登録できない" do
        @order_delivery.post = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post can't be blank")
      end
      it "都道府県欄が「--」では登録できない" do
        @order_delivery.prefecture_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture must be greater than 1")
      end
      it "市区町村が空では登録できない" do
        @order_delivery.cities = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Cities can't be blank")
      end
      it "番地が空では登録できない" do
        @order_delivery.address = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では登録できない" do
        @order_delivery.phone_number = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @order_delivery.post = "1234567"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
      end
    end

  end

end
