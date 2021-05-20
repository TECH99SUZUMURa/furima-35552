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

  # VALID_NAME_REGEX = Regexp.new(/\A[ぁ-んァ-ヶ一-龥々ー]\z/)
  # validates :first_name, format: { with: VALID_NAME_REGEX }
  # validates :last_name, format: { with: VALID_NAME_REGEX }

  #VALID_NAME_KANA_REGEX = Regexp.new(/\A[ァ-ヶー]\z/)
  #validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX }
  #validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX }

  # VALID_EMAIL_REGEX = Regexp.new(/\A[\w+\-.]+@[a-z\d\-.]+.[a-z]+\z/i)
  # validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  #VALID_PASSWORD_REGEX = Regexp.new(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}\z/i)
  #validates :encrypted_password, format: { with: VALID_PASSWORD_REGEX }



end