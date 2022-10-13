class HerosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
        def index
        heros =Hero.all
        render json:heros
        end
    
        def show
            hero = find
            render json: hero, status: :created 
        end
    
        private
    
        def find
            Hero.find(params[:id])
        end
        def not_found_response
            render json: {error: "Hero not found"}, status: :not_found
        end
    end