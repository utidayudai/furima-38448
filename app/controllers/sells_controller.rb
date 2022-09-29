class SellsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_sell, only: [:edit, :show]
  before_action :ensure_user, { only: [:edit, :update] }

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

  def update
    @sell = Sell.find(params[:id])
    if @sell.update(sell_params)
      redirect_to sell_path
    else
      render :edit
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

  def ensure_user
    @sells = current_user.sells
    @sell = @sells.find_by(id: params[:id])
    redirect_to root_path unless @sell
  end
end
