require 'rails_helper'

describe '商品購入機能' do
  describe PurchaseAddresses do
    before do
      buyer = FactoryBot.create(:user)
      seller = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: seller.id)

      @purchase = FactoryBot.build(:purchase_addresses, purchases_id: buyer.id, user_id: seller.id, item_id: item.id)
    end

    context '商品購入が成功する時' do
      it '全ての項目を入力すると購入できる' do
        expect(@purchase).to be_valid
      end

      it '建物名が空でも購入できる' do
        @purchase.building_name = nil
        expect(@purchase).to be_valid
      end
    end

    context '商品購入が失敗する時' do
      it 'クレジットカード情報が空では購入できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it '郵便番号が空では購入できない' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号に-がないと購入できない' do
        @purchase.postal_code = '12345678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it '郵便番号の4文字目がハイフンが入力されていないと購入できない' do
        @purchase.postal_code = '1-234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it '都道府県のチェックボックスで---の状態では購入できない' do
        @purchase.prefectures_id = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('都道府県は0以外の値にしてください')
      end

      it '市区町村が空では購入できない' do
        @purchase.municipality = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空では購入できない' do
        @purchase.address = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空では購入できない' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号に-があると購入できない' do
        @purchase.phone_number = '1234567890-'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号が12桁以上だと購入できない' do
        @purchase.phone_number = '123456789000'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('電話番号は不正な値です')
      end

    end
  end
end
