class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  Name_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  Name_Kana_REGEX = /\A[ァ-ン]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: true }
    # @のチェックコードは記載しなくても、エラーのレスポンスが表示される
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i }
    validates :last_name, format: { with: Name_REGEX }
    validates :first_name, format: { with: Name_REGEX }
    validates :last_name_kana, format: { with: Name_Kana_REGEX }
    validates :first_name_kana, format: { with: Name_Kana_REGEX }
    validates :birthday
  end
end
