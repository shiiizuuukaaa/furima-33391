require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do

    context '商品の出品ができる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it '画像の添付がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が空だと登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の状態が空だと登録できない' do
        @item.sales_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status Select"
      end
      it '配送料の負担が空だと登録できない' do
        @item.shipping_fee_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status Select"
      end
      it '発送元の地域が空だと登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture Select"
      end
      it '発送までの日数が空だと登録できない' do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery Select"
      end
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が￥300-￥9,999,999の間でないと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it '価格が半角数字でないと登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end
    end

  end
end
