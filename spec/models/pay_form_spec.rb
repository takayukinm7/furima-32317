require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @pay_form = FactoryBot.build(:pay_form)
  end

  describe '購入者情報の保存' do
    context '購入者情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
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
        @pay_form.postal_code = 1_231_234
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空の時' do
        @pay_form.prefecture_id = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture can't be blank")
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
        @pay_form.phone = 111_111_111_111
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
    end
  end
end
