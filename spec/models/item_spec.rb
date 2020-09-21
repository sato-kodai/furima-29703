require 'rails_helper'

describe '商品出品機能' do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できたとき' do
      it '全ての項目を入力すると保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '「出品画像(image)」が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
        @item
      end

      it '「商品名(name)」が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '「商品の説明(comment)」が空では出品できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it '「商品詳細」の「カテゴリー(category_id)」が---では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it '「商品詳細」の「商品の状態(status_id)」が---では出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end

      it '「配送について」の「配送料の負担」が---では出品できない' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 0')
      end

      it '「配送について」の「発送元の地域」が---では出品できない' do
        @item.shipment_source_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 0')
      end

      it '「配送について」の「発送までの日数」が---では出品できない' do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days must be other than 0')
      end

      it '「販売価格(price)」が空欄だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '「販売価格(price)」が半角数字以外で入力すると出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '「販売価格(price)」を299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '「販売価格(price)」を10,000,000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
