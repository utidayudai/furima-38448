require 'rails_helper'

RSpec.describe BuyBuyRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    sell = FactoryBot.create(:sell)
    @buy_buy_record = FactoryBot.build(:buy_buy_record, user_id: user.id, sell_id: sell.id)

  end

  describe '商品購入機能' do
    context'商品購入できる場合'
    it 'place_id,city,address_number,address,phone_numberがあれば購入できる' do
      expect(@buy_buy_record).to be_valid
    end
    it '建物名が空でも購入できる' do
      @buy_buy_record.building = ''
      expect(@buy_buy_record).to be_valid
    end

    context'商品購入できない場合'
    it '郵便番号が空では購入できない' do
      @buy_buy_record.address_number = ''
      @buy_buy_record.valid?
      expect(@buy_buy_record.errors.full_messages).to include("Address number can't be blank")
    end
    it '都道府県が空では購入できない' do
      @buy_buy_record.place_id = '1'
      @buy_buy_record.valid?
      expect(@buy_buy_record.errors.full_messages).to include("")
    end
    it '市区町村が空では購入できない' do
      @buy_buy_record.city = ''
      @buy_buy_record.valid?
      expect(@buy_buy_record.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では購入できない' do
      @buy_buy_record.address = ''
      @buy_buy_record.valid?
      expect(@buy_buy_record.errors.full_messages).to include("")
    end
    it '電話番号が空では購入できない' do
      @buy_buy_record.phone_number = ''
      @buy_buy_record.valid?
      expect(@buy_buy_record.errors.full_messages).to include("")
    end
    #it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能' do
    #end
    #it '電話番号が12桁以上では購入できない' do
    #end
    #it '電話番号が9桁以下では購入できない' do
    #end
    it "tokenが空では購入できない" do
      @buy_buy_record.token = ''
      @buy_buy_record.valid?
      expect(@buy_buy_record.errors.full_messages).to include("Token can't be blank")
    end
  end
end
