class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def new
    @book = Book.new
  end
end
