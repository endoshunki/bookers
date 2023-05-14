class BooksController < ApplicationController
  def top
  end
  
  def index
    @book = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] ="Book was successfully created."
      redirect_to '/books/' + @book.id.to_s
      return
    end
    redirect_to '/books'
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] ="Book was successfully updated."
    redirect_to book_path(book.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end