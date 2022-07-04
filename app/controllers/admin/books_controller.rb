# frozen_string_literal: true

module Admin
  class BooksController < ApplicationController
    def index
      byebug
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
      # byebug
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
    #  byebug
      #@params = params[:search]
      @books = Book.all.where("name LIKE :search OR author LIKE :search", search: "%#{params[:search]}%")
    end

    private

    def book_params
      params.require(:book).permit(:name, :author, :image)
    end
  end
end
