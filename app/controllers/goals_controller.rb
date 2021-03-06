class GoalsController < ApplicationController   
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
    
    def new
        @goal = Goal.new
    end
    
    
    def create
        @goal = current_user.goals.build(goals_params)
            if @goal.save
                flash[:success] = "Your goal has been successfully saved."
                redirect_to current_user
            else
                render root_url
            end    
    end
    
    def destroy
        @goal.destroy
        flash[:success] = "Your goal has been deleted."
        redirect_to request.referrer || root_url
    end
    
       
    def edit
       @goal = Goal.find(params[:id])
    end
    
    def update
        @goal = Goal.find(params[:id])
        if @goal.update(goals_params)
            flash[:succes] = "Your goal has been edited" 
            redirect_to current_user
        else
            render 'edit'
        end
    end
        
    private

    def goals_params
        params.require(:goal).permit(:name, :description)
    end
    
    def correct_user
      @goal = current_user.goals.find_by(id: params[:id])
      redirect_to root_url if @goal.nil?
    end
    
end
