class PurchasesController < ApplicationController
  def index
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
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :manucipality, :address, :building_name).merge(user_id: current_user.id)
  end
end