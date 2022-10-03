class BuysController < ApplicationController
  def index
  end

  def create
    @buy = Buy.create(buy_params)
    Buy_record.create(buy_record_params)
    redirect_to root_path
  end

  private

  def buy_params
    params.permit(:place_id, :city, :address_number, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def address_params
    
  end
end
