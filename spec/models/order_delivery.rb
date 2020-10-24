require 'rails_helper'
RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'postal_codeがあれば保存できる' do
        expect(@order_delivery).to be_valid
      end

      it 'postal_codeにハイフンがあれば保存できる' do
        expect(@order_delivery).to be_valid
      end

      it 'area_idがあれば保存できること' do
        expect(@order_delivery).to be_valid
      end

      it 'cityがあれば保存できること' do
        expect(@order_delivery).to be_valid
      end

      it 'blockがあれば保存できること' do
        expect(@order_delivery).to be_valid
      end

      it 'phone_numberがあれば保存できること' do
        expect(@order_delivery).to be_valid
      end

      it 'phone_numberが11桁以下でハイフンがなければ保存できること' do
        expect(@order_delivery).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できない' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと保存できない' do
        @order_delivery.postal_code = '1234567'
      end

      it 'area_idが空だと保存できない' do
        @order_delivery.area_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end

      it 'area_idが1だと保存できない' do
        @order_delivery.area_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Area must be other than 1')
      end

      it 'cityが空だと保存できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと保存できない' do
        @order_delivery.block = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上で保存できないこと' do
        @order_delivery.phone_number = '090123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
