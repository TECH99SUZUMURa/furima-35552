require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができるとき' do
      it 'nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, phone_numが全て存在すれば登録できる' do
        expect(@user).to be_valid 
      end

      it 'passwordとpassword_confirmationが半角性数字混合の6文字以上であれば登録できる' do
        @user.password = 'AA11AA'
        @user.password_confirmation = 'AA11AA'
        expect(@user).to be_valid
      end

      it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）の入力があれば登録できる' do
        @user.first_name = 'あ'
        @user.last_name = 'あ'
        expect(@user).to be_valid
      end

      it 'フリガナは、全角（カタカナ）の入力があれば登録できる' do
        @user.first_name_kana = 'ア'
        @user.last_name_kana = 'ア'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが空の状態では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空の状態では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailには重複したデータは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

      it 'emailには@が含まれていないデータは登録できない' do
        @user.email = "google.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空の状態では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在しても、password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordおよびpassword_conformationには半角英数字混合ではないデータは登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'Abcd1'
        @user.password_confirmation = 'Abcd1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end