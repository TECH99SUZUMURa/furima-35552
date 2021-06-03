require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.3
    end

    context '商品が購入できる場合' do
      it '必要な情報がすべて揃っていれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = ''
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが空では半角のハイフン（-）を含んだ正しい形式でないと購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空では購入できない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが数字以外では購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'prefecture_idが1のときは購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'manucipalityが空では購入できない' do
        @purchase_address.manucipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Manucipality can't be blank")
      end

      it 'manucipalityに半角英数字が含まれていては購入できない' do
        @purchase_address.manucipality = 'あ阿ア1a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Manucipality is invalid')
      end

      it 'manucipalityに全角英数字が含まれていては購入できない' do
        @purchase_address.manucipality = 'あ阿ア１Ａ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Manucipality is invalid')
      end

      it 'manucipalityに記号が含まれていては購入できない' do
        @purchase_address.manucipality = 'あ-阿@ア'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Manucipality is invalid')
      end

      it 'addressが空では購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'addressに半角英語が含まれていては購入できない' do
        @purchase_address.address = 'a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Address is invalid')
      end

      it 'addressに全角英語が含まれていては購入できない' do
        @purchase_address.address = 'Ａ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Address is invalid')
      end

      it 'addressに半角ハイフン(-)以外の記号が含まれていては購入できない' do
        @purchase_address.address = '@'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Address is invalid')
      end

      it 'phone_numが空では購入できない' do
        @purchase_address.phone_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが全角数字では購入できない' do
        @purchase_address.phone_num = '１２３４５６７８９１２'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid. Only 11 half-width numbers without hyphen(-)')
      end

      it 'phone_numが半角英語では購入できない' do
        @purchase_address.phone_num = 'abcdefghijk'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid. Only 11 half-width numbers without hyphen(-)')
      end

      it 'phone_numが10文字以下では購入できない' do
        @purchase_address.phone_num = '1234567891'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid. Only 11 half-width numbers without hyphen(-)')
      end

      it 'phone_numが12文字以上では購入できない' do
        @purchase_address.phone_num = '123456789123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid. Only 11 half-width numbers without hyphen(-)')
      end

      it 'phone_numにハイフン（-）が含まれていては購入できない' do
        @purchase_address.phone_num = '090-0000-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid. Only 11 half-width numbers without hyphen(-)')
      end

      it 'userが紐づいていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
