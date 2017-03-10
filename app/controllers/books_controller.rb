class BooksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.accessible_by(current_ability)
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def show

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @book.update (book_params_update)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to action: 'index'
  end

  private
  def book_params
    params.require(:book).permit(:name, :address, :number, :email, :user_id)
  end

  def book_params_update
    params.require(:book).permit(:name, :address, :number, :email)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
