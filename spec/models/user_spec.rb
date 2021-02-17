require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

  context 'ユーザー新規登録ができるとき' do 

    it '登録条件(nickname,name,email,furigana,birth_date)を満たせば存在すれば登録できること' do
      expect(@user).to be_valid
    end
    
    it "emailには＠があれば登録できること" do
      @user.email = "aaaa@aaa"
      expect(@user).to be_valid
    end

    it "passwordは6文字以上であれば登録できること" do
      @user.password = "a23456"
      @user.password_confirmation = "a23456"
      expect(@user).to be_valid
    end
   
    it "passwordは半角英数字混合であれば登録できること" do
      @user.password = "abc456"
      @user.password_confirmation = "abc456"
      expect(@user).to be_valid
    end

    it "nameは漢字、カタカナ、ひらがなであれば登録できること" do
      @user.last_name = "あア阿"
      expect(@user).to be_valid
    end

    it "last_nameは漢字、カタカナ、ひらがなであれば登録できること" do
      @user.last_name = "あア阿"
      expect(@user).to be_valid
    end

    it "first_nameは漢字、カタカナ、ひらがなであれば登録できること" do
      @user.first_name = "あア阿"
      expect(@user).to be_valid
    end

    it "last_furiganaはカタカナで登録できること" do
      @user.first_name = "カナ"
      expect(@user).to be_valid
    end

    it "first_furiganaはカタカナで登録できること" do
      @user.first_name = "カナ"
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録ができないとき' do 
    it 'nameが空では登録できないこと' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "emailで@がなければ登録できないこと" do
      @user.email = 'email.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
     
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
   
    it "passwordは全角の場合は登録できないこと" do
      @user.password = "１２３４５A"
      @user.password_confirmation = "１２３４５A"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角数字のみの場合は登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角英字のみの場合は登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
    it "last_nameは全角（漢字・ひらがな・カタカナ）出なければ登録できないこと" do
      @user.last_name = 'a1ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameは全角（漢字・ひらがな・カタカナ）出なければ登録できないこと" do
      @user.first_name = 'a1ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "last_furiganaが空では登録できないこと" do
      @user.last_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana is invalid")
    end

    it "first_furiganaが空では登録できないこと" do
      @user.first_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana is invalid")
    end

    it "last_furiganaがカタカナでなければ登録できないこと" do
      @user.last_furigana = 'aあ阿'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana is invalid")
    end

    it "first_furiganaがカタカナでなければ登録できないこと" do
      @user.first_furigana = 'aあ阿'
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana is invalid")
    end

    it "birth_dateが空では登録できないこと" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
 end
end