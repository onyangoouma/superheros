class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
        def index
            powers = Power.all
            render json:powers, status: :created
        end
    
        def show
            power = find_powers
            render json: power ,status: :created
    
        end
    
        def update
            power =find_powers
            power.update(power_params)
            render json: power, status: :created
        end
        private
    
        def find_powers
            Power.find(params[:id])
        end
         def power_params 
            params.permit(:description)
         end
    
        def not_found_response
            render json: {error: "Power not found"}, status: :not_found
        end
    
        def render_unprocessable_entity_response(invalid)
            render json: {errors:invalid.record.errors.full_messages},status: :unprocessable_entity
        end
    
    end
    