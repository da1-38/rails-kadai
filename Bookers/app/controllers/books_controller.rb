class BooksController < ApplicationController
 # ko-rubacknituiteshiraberu
 before_action :set_book, only: [:show, :edit, :update]

def top
end

 def new
  @book = Book.new
 end

 def create
  @book = Book.new(book_params)

  if @book.save
   flash[:success] = "Book was successfully created."
     redirect_to book_path(@book)
  else
   @books = Book.all
   render action: :index
  end
 end

 def index
  @book = Book.new
  @books = Book.all
 end

 def show
 end

 def edit
 end

 def update
  if @book.update(book_params)
   flash[:success] = "Book was successfully updeted."
     redirect_to book_path(@book)
  else
   render action: :edit
  end

  # updateできなかった場合をこうりょする

 end

 def destroy
  book = Book.find(params[:id])
  # destroyできなかった場合をこうりょする
  book.destroy
  redirect_to books_path(book)
  # redirect_to book_path(book)
  #_path : Perfix_path
   if book.destroy
    flash[:notice] = "Book was successfully destroyed."
   end
 end

 private
 def book_params
  params.require(:book).permit(:title, :body)
 end

 def set_book
  @book = Book.find(params[:id])
 end

end

