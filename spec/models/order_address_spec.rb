require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品がが購入できる場合' do
      it "'すべての値が正しく入力されていれば保存できること'" do
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空では購入できない' do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end

      it '発送元の情報が空では出品を保存できない' do
        @order_address.shipment_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Shipment area must be other than 1')
      end

      it 'postal_codeはハイフンがないと購入できない' do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'phoneが空では購入できない' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank", 'Phone is invalid')
      end

      it 'phoneは11桁以内でないと購入できない' do
        @order_address.phone = '1234567891011'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
