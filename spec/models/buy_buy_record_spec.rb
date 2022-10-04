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
    end
    it '建物名が空でも購入できる' do
    end

    context'商品購入できない場合'
    it '郵便番号が空では購入できない' do
    end
    it '都道府県が空では購入できない' do
    end
    it '市区町村が空では購入できない' do
    end
    it '番地が空では購入できない' do
    end
    it '電話番号が空では購入できない' do
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能' do
    end
    it '電話番号が12桁以上では購入できない' do
    end
    it '電話番号が9桁以下では購入できない' do
    end
  end
end
