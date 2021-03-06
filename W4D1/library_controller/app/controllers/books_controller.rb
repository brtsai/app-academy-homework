class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    # your code here
  end

  def destroy
    # your code here
    book = Book.find(params[:id])
    if book.destroy
      redirect_to action: 'index', status: 200
    else
      redirect_to action: 'index', status: 500
    end 
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
