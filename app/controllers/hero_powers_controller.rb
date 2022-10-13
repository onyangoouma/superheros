class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        def create
             hero_powers =HeroPower.create(hero_powers_params)
             render json: hero_powers,status: :created
    
        end
        private
        def hero_powers_params
            params.permit(:strength,:power_id,:hero_id)
        end
    
        def render_unprocessable_entity_response(invalid)
            render json: {errors:invalid.record.errors.full_messages},status: :unprocessable_entity
        end
    end
    