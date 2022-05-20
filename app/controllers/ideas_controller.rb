class IdeasController < ApplicationController

    def index
        @ideas = Idea.all
    end

    def show
        @idea = Idea.find(params[:id])
    end

    def new
        @idea = Idea.new
    end
    
    def create
        @idea = Idea.new(ideas_params)

        if @idea.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def ideas_params
        params.require(:idea).permit(:name, :description, :picture)
    end
end
