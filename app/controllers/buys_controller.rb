class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :buy_set_item, only:[:index, :create]

  def index
    @buy_buy_record = BuyBuy_record.new
  end

  def create
    @buy_buy_record = BuyBuy_record.new(buy_params)
    if @buy_buy_record.valid?
      @buy_buy_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_buy_record).permit(:place_id, :address_number, :address, :building, :phone_number).merge(user_id: current_user.id, sell_id: params[:sell_id])
  end

  def buy_set_item
    @sell = Sell.find(params[:sell_id])
  end
end
