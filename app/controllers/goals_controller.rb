class GoalsController < ApplicationController
    def new
        @goal = Goal.new
    end
    
    
    def create
        @goal = current_user.goals.build(goals_params)
            if @goal.save
                flash[:success] = "Your goal has been successfully saved."
                redirect_to root_url
            else
                render root_url
            end    
    end
    
    def destroy
    end
    
    private

    def goals_params
        params.require(:goal).permit(:name, :description)
    end
    
end
