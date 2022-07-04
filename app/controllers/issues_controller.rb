class IssuesController < ApplicationController
  def index
      #@books = Book.all
      #check_book_availability
      @books = Book.order(:id).page params[:page]
  end

  def new 
      @issue = Issue.new
  end

  def create
    @issue = Issue.new(book_id: params[:book_id], user_id: params[:user_id])
    if @issue.save
      flash.now[:notice] = "Issue book successfully"
      redirect_to issues_path, notice: "Issue book succesfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def buy 
  #   #byebug
  #   user = User.new(buy_params)
  #   if user.save
  #     redirect_to issues_path
  #   else 
  #     render :buy, status: :unprocessable_entity
  #   end

  # end



  private

  def book_params
    params.require(:book).permit(:name, :author)
  end
  
  # def buy_params
  #     params.require(:user_plan).permit(:user_id, :plan_id)
  # end


   
  # def check_book_availability
  #   if Issue.where(book_id: params[:book_id])
  #     render " /users/index"
  #   else
  #     self.save
  #   end
  # end
end
