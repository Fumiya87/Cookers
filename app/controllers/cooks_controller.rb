class CooksController < ApplicationController
    def index
        @user=current_user
        @cooks=Cook.all
        @cook=Cook.new
    end 
    
    def show 
        @cook=Cook.find(params[:id])
        @cook_new=Cook.new
    end 
    
    def edit 
        @cook=Cook.find(params[:id])
        if @cook.user.id == current_user.id 
        render"edit"
        else
        redirect_to cooks_path
        end 
    end 
    
    def update
        @cook=Cook.find(params[:id])
        if @cook.update(cook_params)
           flash[:aiueo]="You have updated book successfully"
           redirect_to cook_path(@cook)
        else
         render :edit
        end 
    end
    
    def create 
        @cook=Cook.new(cook_params)
        @cook.user_id = current_user.id
        if@cook.save
         flash[:success]="You have created cook successfully"
         redirect_to cook_path(@cook)
        else
        @user=current_user
        @cooks=Cook.all
        render :index
        end  
    end 
    
    def destroy 
        @cook=Cook.find(params[:id])
        @cook.destroy
        redirect_to cooks_path
    end 
    
    private 
    def cook_params
        
        params.require(:cook).permit(:title, :body )
    end     
end
