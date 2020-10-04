class User < ApplicationRecord
  has_many :items
  has_many :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/
  KANA_REGEX =  /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])/

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: ZENKAKU_REGEX }
    validates :last_name, format: { with: ZENKAKU_REGEX }
    validates :first_name_kana, format: { with: KANA_REGEX }
    validates :last_name_kana, format: { with: KANA_REGEX }
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :password_confirmation
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
    validates :birth_date
  end
  validates :password, length: { minimum: 6 }

end
