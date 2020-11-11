require 'rails_helper'
describe UserOrder do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @item  = FactoryBot.create(:item, user_id: @user1.id)
    @user_order = FactoryBot.build(:user_order, item_id: @item.id, user_id: @user2.id)
    sleep(1)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it "token,postal_code,prefectures_id,municipality,address,building_name,phone_numberが存在すれば登録できる" do
        expect(@user_order).to be_valid
      end
      it"building_nameが空でも登録出来る" do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "tokenが空だと登録できない" do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと登録できない" do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeに-が入っていないと登録できない" do
        @user_order.postal_code = 1234567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefectures_idが0だと登録できない" do
        @user_order.prefectures_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefectures must be other than 0")
      end
      it "municipalityが空だと登録できない" do
        @user_order.municipality = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空だと登録できない" do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is not a number")
      end
      it "phone_numberが数字以外だと登録できない" do
        @user_order.phone_number = "aaaaaaaaaaa"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが11桁以上だと登録できない" do
        @user_order.phone_number = "090123456789"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end