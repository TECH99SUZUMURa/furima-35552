require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができるとき' do
      it 'nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, phone_numが全て存在すれば登録できる'
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      end

      it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）の入力があれば登録できる' do
      end

      it 'フリガナは、全角（カタカナ）の入力があれば登録できる' do
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが空の状態では登録できない' do
      end

      it 'emailが空の状態では登録できない' do
      end

      it 'emailには重複したデータは登録できない' do
      end

      it 'emailには@が含まれていないデータは登録できない' do
      end

      it 'passwordが空の状態では登録できない' do
      end

      it 'passwordが存在しても、password_confirmationが空では登録できない' do
      end

      it 'passwordおよびpassword_conformationには半角英数字混合ではないデータは登録できない' do
      end

      it 'passwordが5文字以下では登録できない' do
      end
    end
  end

  describe 'ユーザーログイン' do
    context 'ユーザーログインができるとき' do
      it 'emailとpasswordが存在すれば登録できる' do
      end
    end

    context 'ユーザーログインができないとき' do
      it 'emailが空の状態では登録できない' do
      end

      it 'passwordが空の状態では登録できない' do
      end
    end
  end
end
