class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index_owner, only: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render template "items/index"
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :manucipality, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index_owner
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end
end