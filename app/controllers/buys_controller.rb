class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :seller_cannot_buy, { only: [:index, :create] }
  before_action :purchasing_and_login_restrictions, only: [:index]
  before_action :detail_screen_migration_restrictions, only: [:index]

  def index
    @buy_buy_record = BuyBuyRecord.new
  end

  def create
    @buy_buy_record = BuyBuyRecord.new(buy_params)
    if @buy_buy_record.valid?
      pay_item
      @buy_buy_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_buy_record).permit(:place_id, :city, :address_number, :address, :building, :phone_number).merge(
      user_id: current_user.id, sell_id: params[:sell_id], token: params[:token]
    )
  end

  def purchasing_and_login_restrictions
    redirect_to user_session_path unless user_signed_in?
  end

  def seller_cannot_buy
    @sell = Sell.find(params[:sell_id])
    redirect_to root_path if current_user == @sell.user_id
  end

  def detail_screen_migration_restrictions
    @sell = Sell.find(params[:sell_id])
    redirect_to root_path if BuyRecord.exists?(sell_id: @sell.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @sell.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
