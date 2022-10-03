class BuysController < ApplicationController
  def index
  end

  def new
    @buy_buy_record = BuyBuy_record.new
  end

  def create
    @buys_buy_record = BuyBuy_record.new(buy_params)
    if @buys_buy_record.valid?
      @buys_buy_record.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buy_params
    params.require(:buys_buy_record).permit(:place_id, :address_number, :address, :building, :phone_number).merge(user_id: current_user.id, sell_id: sell.id)
  end

  
end
