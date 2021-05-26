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
        @user.last_name = 'あ'
        @user.first_name = 'あ'
        expect(@user).to be_valid
      end

      it 'フリガナは、全角（カタカナ）の入力があれば登録できる' do
        @user.last_name_kana = 'ア'
        @user.first_name_kana = 'ア'
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
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailには@が含まれていないデータは登録できない' do
        @user.email = 'google.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空の状態では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
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
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'Abcd1'
        @user.password_confirmation = 'Abcd1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'last_nameが空の状態だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが半角文字だと登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが空の状態だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが半角文字だと登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_kanaが空の状態だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaが半角文字だと登録できない' do
        @user.last_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'last_name_kanaが全角カナ以外の全角文字（漢字・ひらがな）だと登録できない' do
        @user.last_name_kana = 'ひら仮名'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kanaが空の状態だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaが半角文字だと登録できない' do
        @user.first_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'first_name_kanaが全角カナ以外の全角文字（漢字・ひらがな）だと登録できない' do
        @user.first_name_kana = 'ひら仮名'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'birthdayが空の状態では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
