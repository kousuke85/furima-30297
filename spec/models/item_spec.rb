require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("files/furima-intro01.png")
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "image、name,text,category_id,condition_id,deliverycharge_id,deliveryarea_id,deliverydays_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空だと登録できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "category_idの値が0だと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "condition_idが空だと登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "condition_idの値が0だと登録できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it "deliverycharge_idが空だと登録できない" do
        @item.deliverycharge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverycharge is not a number")
      end
      it "deliverycharge_idの値が0だと登録できない" do
        @item.deliverycharge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverycharge must be other than 0")
      end
      it "deliveryarea_idが空だと登録できない" do
        @item.deliveryarea_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryarea is not a number")
      end
      it "deliveryarea_idの値が0だと登録できない" do
        @item.deliveryarea_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryarea must be other than 0")
      end
      it "deliverydays_idが空だと登録できない" do
        @item.deliverydays_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverydays is not a number")
      end
      it "deliverydays_idの値が0だと登録できない" do
        @item.deliverydays_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverydays must be other than 0")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it "priceの値が300より小さいと登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceの値が999999より大きいと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角数字じゃないと登録できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end