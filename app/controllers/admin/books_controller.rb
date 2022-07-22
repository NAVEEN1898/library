# frozen_string_literal: true

module Admin
  class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
      @books = Book.order(:id).page params[:page]
    end

    def show
      @book = Book.find(params[:id])
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to admin_books_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
      @book = Book.find(params[:id])

      if @book.update(book_params)
        redirect_to admin_books_path
      else
        render :edit
      end
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to root_path
    end

    def search
      @books = Book.all.where('name LIKE :search OR author LIKE :search', search: "%#{params[:search]}%")
    end

    private

    def book_params
      params.require(:book).permit(:name, :author, :image, :tag_list)
    end
  end
end
