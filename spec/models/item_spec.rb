require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context "出品が保存できる場合" do
      it "出品条件を満たせば存在すれば保存できること" do
        expect(@item).to be_valid
      end
      it "商品価格が300円以上であれば出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "商品価格が9999999円以下であれば出品できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context "出品が保存できない場合" do
      it "商品名が空では出品を保存できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end 
      it "画像が空では出品を保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end 

      it "商品の説明が空では出品を保存できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end 
      it "カテゴリー情報が空では出品を保存できない" do
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end 
      it "商品の状態についての情報が空では出品を保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end 
      it "配送料の負担についての情報が空では出品を保存できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end 
      it "発送元の情報が空では出品を保存できない" do
        @item.shipment_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment area must be other than 1")
      end 
      it "発送までの日数についての情報が空では出品を保存できない" do
        @item.shipment_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date is not a number")
      end 
      it "商品価格についての情報が空では出品を保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it "商品価格が300円以下では出品を保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
      it "商品価格が9999999円以上では出品を保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "商品価格が全角数字での出品は保存できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
    end
  end
end
