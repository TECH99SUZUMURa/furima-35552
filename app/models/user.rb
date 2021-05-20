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
    validates :birth_day
  end

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :first_name, with: VALID_NAME_REGEX
  validates_format_of :last_name, with: VALID_NAME_REGEX

  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :first_name_kana, with: VALID_NAME_KANA_REGEX
  validates_format_of :last_name_kana, with: VALID_NAME_KANA_REGEX
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: VALID_PASSWORD_REGEX



end