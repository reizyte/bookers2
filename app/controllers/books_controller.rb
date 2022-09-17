class BooksController < ApplicationController
  def new

  end

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
