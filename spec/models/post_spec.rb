require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.image = fixture_file_upload('test/fixtures/files/test_image.jpg')
  end

  describe '記事の投稿' do

    context '記事の投稿に成功する場合' do

      it '必要な情報が正しく入力されていれば投稿に成功する' do
        expect(@post).to be_valid
      end

      it '画像は空でも投稿に成功する' do
        @post.image = nil
        @post.valid?
      end

      it 'category_idは2以上で登録に成功する' do
        @post.category_id = Faker::Number.number(digits: 2)
        @post.valid?
      end

    end

    context '記事の投稿に失敗する場合' do

      it 'titleが空で投稿に失敗する' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空で投稿に失敗する' do
        @post.content = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank")
      end

      it 'category_idが空で投稿に失敗する' do
        @post.category_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1で投稿に失敗する' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Category Select")
      end

      it '紐づくユーザーが存在しないと投稿に失敗する' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end

    end

  end

end