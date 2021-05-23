class BooksController < ApplicationController
    def index
        @user=current_user
        @books=Book.all
        @book=Book.new
    end 
    
    def show 
        @book=Book.find(params[:id])
        @book_new=Book.new
    end 
    
    def edit 
        @book=Book.find(params[:id])
        if @book.user.id == current_user.id 
        render"edit"
        else
        redirect_to books_path
        end 
    end 
    
    def update
        @book=Book.find(params[:id])
        if @book.update(book_params)
           flash[:aiueo]="You have updated book successfully"
           redirect_to book_path(@book)
        else
         render :edit
        end 
    end
    
    def create 
        @book=Book.new(book_params)
        @book.user_id = current_user.id
        if@book.save
         flash[:success]="You have created book successfully"
         redirect_to book_path(@book)
        else
        @user=current_user
        @books=Book.all
        render :index
        end  
    end 
    
    def destroy 
        @book=Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end 
    
    private 
    def book_params
        
        params.require(:book).permit(:title, :body )
    end     
end
