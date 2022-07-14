# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::BooksController, type: :controller do
  let(:book) { FactoryBot.create(:book) }
  let!(:user) { FactoryBot.create(:user) }

  before do
    sign_in(user)
  end

  describe '#index' do
    it 'show all books' do
      get :index
      expect(assigns(:books)).to eq([book])
    end
  end

  describe '#show' do
    it 'find book(book_id)' do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe '#create' do
    it 'create book(book)' do
      post :create, params: { book: { name: book.name, author: book.author } }
      expect(Book.count).to eq(2)
      expect(response.status).to eq(302)
    end
  end

  describe '#edit' do
    it 'edit book ' do
      get :edit, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe '#update' do
    it 'update book(book_id)' do
      patch :update, params: { book: { name: book.name, author: book.author }, id: book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe '#destroy' do
    let(:book) { FactoryBot.create(:book) }
    let(:book1) { FactoryBot.create(:book) }
    it 'destroy book(book_id)' do
      delete :destroy, params: { id: book.id }
      expect(response.status).to eq(302)
    end
  end

  describe '#search' do
    let(:book) { FactoryBot.create(:book) }
    let(:book1) { FactoryBot.create(:book) }
    it 'search by book name' do
      get :search, params: { search: book.name }
      expect(assigns(:books)).to eq([book, book1])
    end

    it 'search by author name' do
      get :search, params: { search: book.author }
      expect(assigns(:books)).to eq([book, book1])
    end
  end
end
