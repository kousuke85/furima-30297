class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_item, only: [:show,:create]
  before_action :move_to_index, only: [:show]

  def show
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
     if @user_order.valid?
        pay_item
        @user_order.save
        redirect_to root_path
     else
        render :show
     end
  end
 
  private
  def order_params
   params.require(:user_order).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :purchaserecord_id).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    @item = Item.find(params[:id])
    if  current_user.id == @item.user.id

      redirect_to controller: :items, action: :index
    end

    unless @item.purchaserecord == nil
      redirect_to controller: :items, action: :index
    end

  end


end