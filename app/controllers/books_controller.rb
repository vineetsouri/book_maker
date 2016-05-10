class BooksController < ApplicationController
  before_action :fetch_book, only: [:show, :destroy]

  def index
    @book = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if params[:title_confirmation].downcase == @book.title.downcase
      @book.destroy
      redirect_to books_path, success: "The book titled '#{@book.title}' is successfully deleted"
    else
      redirect_to book_path(@book), danger: "Book is not deleted as you entered wrong book name"
    end
  end


private

  def book_params
    params.require(:book).permit(:title, :notes)
  end

  def fetch_book
    @book = Book.find(params[:id])
  end
end
