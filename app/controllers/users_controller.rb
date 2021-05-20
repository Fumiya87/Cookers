class UsersController < ApplicationController
    def index
        @user=User.all
        @books=Books.all
        @book=Book.new
    end
    
    def show
        @user=User.find(params[:id])
    end 
    
    def edit
        @user=User.find(params[:id])
    end 
    
    def update
        @user=User.find(params[:id])
        @user.update(user_params)
        redirect_to users_path
        
    end 
    
    private
    
    def user_params
         params.require(:user).permit(:name, :image, :introduction)
    end    
    
end
