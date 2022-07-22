# frozen_string_literal: true

class IssuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.order(:id).page params[:page]
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(book_id: params[:book_id], user_id: params[:user_id])
    if @issue.save
      flash.now[:notice] = 'Issue book successfully'
      redirect_to issues_path, notice: 'Issue book succesfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :author)
  end
end
