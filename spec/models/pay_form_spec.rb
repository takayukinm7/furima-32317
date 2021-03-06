require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    sleep 0.5
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @pay_form = FactoryBot.build(:pay_form, user_id: user.id, item_id: item.id)
  end

  describe '購入者情報の保存' do
    context '購入者情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@pay_form).to be_valid
      end

      it 'buildingが空でも保存できること' do
        @pay_form.building = ''
        expect(@pay_form).to be_valid
      end

    end

    context '購入者情報が保存できない場合' do
      it 'カード情報が空の時' do
        @pay_form.token = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空の時' do
        @pay_form.postal_code = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがない時' do
        @pay_form.postal_code = 1231234
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空の時' do
        @pay_form.prefecture_id = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が-でない時' do
        @pay_form.prefecture_id = 1
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空の時' do
        @pay_form.city = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空の時' do
        @pay_form.numbering = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Numbering can't be blank")
      end

      it '電話番号が空の時' do
        @pay_form.phone = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が１２文字以上の時' do
        @pay_form.phone = 111111111111
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone is invalid')
      end

      it '数字のみでないと登録できないこと' do
        @pay_form.phone = 190-1232-12
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone is invalid")
      end

      it '英数混合では登録できないこと' do
        @pay_form.phone = 'a34d'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end
