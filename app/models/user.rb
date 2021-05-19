class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :nickname
    validates :birth_day
  end

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]\z/
  validates :first_name, format: { with: NAME_REGEX }
  validates :last_name, format: { with: NAME_REGEX }

  NAME_KANA_REGEX = /\A[ァ-ヶー]\z/
  validates :first_name_kana format: { with: NAME_KANA_REGEX }
  validates :last_name_kana format: { with: NAME_KANA_REGEX }

  EMAIL_REGEX = /\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}\z/i
  validates :encrypted_password format: { with: PASSWORD_REGEX }



end