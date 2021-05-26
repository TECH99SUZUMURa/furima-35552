require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規出品' do
    context '新規出品ができるとき' do
      it 'item_name, price, image, text, category_id, condition_id, shipping_charge_id, prefecture_id, estimated_shipping_date_idが全て存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'priceは半角数字の入力があれば出品できる' do
        @item.price = 500
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '新規出品ができないとき' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceは全角の数字では出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは半角英語では出品できない' do
        @item.price = 'thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは半角英数字混合では出品できない' do
        @item.price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが数字以外では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'category_idが1のときは出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'condition_idが空では出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idが数字以外では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end

      it 'condition_idが1のときは出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it 'shipping_charge_idが空では出品できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'shipping_charge_idが数字以外では出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge is not a number')
      end

      it 'shipping_charge_idが1のときは出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが数字以外では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'prefecture_idが1のときは出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'estimated_shipping_date_idが空では出品できない' do
        @item.estimated_shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end

      it 'estimated_shipping_date_idが数字以外では出品できない' do
        @item.estimated_shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Estimated shipping date is not a number')
      end

      it 'estimated_shipping_date_idが1のときは出品できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Estimated shipping date must be other than 1')
      end

      it 'priceは300以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceは10000000では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
