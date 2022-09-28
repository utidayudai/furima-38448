class SellsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  before_action :set_sell, only: [:edit, :show]

  def index
    @sells = Sell.order('created_at DESC')
  end

  def new
    @sell = Sell.new
  end

  def show
  end

  def edit
  end

  def create
    @sell = Sell.new(sell_params)
    if @sell.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sell_params
    params.require(:sell).permit(:title, :title_content, :price, :category_id, :condition_id, :derivery_price_id, :place_id,
                                 :delively_id, :image).merge(user_id: current_user.id)
  end

  def set_sell
    @sell = Sell.find(params[:id])
  end
end
