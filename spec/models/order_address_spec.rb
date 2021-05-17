require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品の購入ができる時' do
      it '全ての項目が存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空だと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号にハイフンがないと購入できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code Input correctly'
      end
      it '都道府県が空だと購入できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Prefecture Select'
      end
      it '市区町村が空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空だと購入できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Addresses can't be blank"
      end
      it '電話番号が空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号にハイフンが入っていると購入できない' do
        @order_address.phone_number = '000-0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number Input only number'
      end
      it '電話番号に英字が入っていると購入できない' do
        @order_address.phone_number = 'aaaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number Input only number'
      end
    end
  end
end
