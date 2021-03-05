require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end

  describe 'コメントの投稿' do
    context 'コメントの投稿に成功する場合' do
      it '必要な情報が正しく入力されていれば投稿に成功する' do
        expect(@chat).to be_valid
      end
    end

    context 'コメントの投稿に失敗する場合' do
      it 'textが空では投稿に失敗する' do
        @chat.text = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include("Text can't be blank")
      end

      it '紐ずくユーザーが存在しないと投稿に失敗する' do
        @chat.user_id = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('User must exist')
      end
    end
  end
end
