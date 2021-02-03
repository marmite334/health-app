require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの投稿' do

    context 'コメントの投稿に成功する場合' do

      it '必要な情報が正しく入力されていれば投稿に成功する' do
        expect(@comment).to be_valid
      end

    end

    context 'コメントの投稿に失敗する場合' do

      it 'contentが空だと投稿に失敗する' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end

      it '紐づくユーザーが存在しないと投稿に失敗する' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end

      it '紐づく記事が存在しないと投稿に失敗する' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post must exist")
      end

    end

  end

end
