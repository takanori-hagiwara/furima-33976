class User < ApplicationRecord
    # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
      with_options presence: true do
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         validates :name
         validates :birth_date
      end
    
      with_options  presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
         validates :last_name 
         validates :first_name
      end
    
      with_options format: { with: /\A[ァ-ヶー－]+\z/} do
        validates :last_furigana
        validates :first_furigana
      end
end