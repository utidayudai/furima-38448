require 'rails_helper'

RSpec.describe Sell, type: :model do
  before do
    @sell = FactoryBot.build(:sell)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合'
    it '全ての項目が存在すれば出品できる' do
      expect(@sell).to be_valid
    end

    context '商品が出品できない場合' do
      it 'ユーザーが紐付いていなければ投稿できない' do
        @sell.user = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include('User must exist')
      end
      it '商品名が空では保存できない' do
        @sell.title = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明は空では保存できない' do
        @sell.title_content = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Title content can't be blank")
      end
      it '商品の説明は1000文字以内でないと保存できない' do
        @sell.title_content = Faker::Lorem.characters(number: 1001)
        @sell.valid?
        expect(@sell.errors.full_messages).to include('Title content is too long (maximum is 1000 characters)')
      end
      it '値段が空では保存できない' do
        @sell.price = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Price can't be blank")
      end
      it '値段(半角)は、半角(数字)での入力が必須であること' do
        @sell.price = '１２３'
        @sell.valid?
        expect(@sell.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が300円以上でなければ出品できない' do
        @sell.price = 299
        @sell.valid?
        expect(@sell.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が9999999円以下でなければ出品できない' do
        @sell.price = 10_000_000
        @sell.valid?
        expect(@sell.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'カテゴリーが空では保存できない' do
        @sell.category_id = '1'
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では保存できない' do
        @sell.condition_id = '1'
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空では保存できない' do
        @sell.derivery_price_id = '1'
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Derivery price can't be blank")
      end
      it '発送場所を指定しないと出品できない' do
        @sell.place_id = '1'
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Place can't be blank")
      end
      it '発送までの日数を指定しないと出品できない' do
        @sell.delively_id = '1'
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Delively can't be blank")
      end
      it 'imageが空では保存できない' do
        @sell.image = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
