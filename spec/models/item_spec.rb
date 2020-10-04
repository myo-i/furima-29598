require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'imageがあれば保存できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字であれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空だと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_state_idが空だと保存できない' do
        @item.product_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product state can't be blank")
      end

      it 'payment_burden_idが空だと保存できない' do
        @item.payment_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment burden can't be blank")
      end

      it 'area_idが空だと保存できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満では保存できない' do
        @item.price = '299'
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it 'priceが9999999より大きいと保存できない' do
        @item.price = '10000000'
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      
    end
  end
end