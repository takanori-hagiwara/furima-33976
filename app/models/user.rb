class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
        with_options presence: true do
         validates :password, format: { with: /\A[a-z0-9]+\z/}
         validates :name
         validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :last_furigana, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :first_furigana,  format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth_date
        end
      end
