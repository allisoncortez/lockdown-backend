class Api::V1::PlayersController < ApplicationController
    def index #GET /players
        players = Player.all 
        render json: PlayerSerializer.new(players), status: :accepted
    end

    def create
        # player = Player.find_or_create_by(name: params[:player_name])
        player = Player.new(name: params[:player_name])

        if player.save
            render json: PlayerSerializer.new(player), status: :accepted
        else 
            render json: {errors: player.errors.full_messages}, status: :unprocessible_entity
        end
    end

    # private 

    # def player_params
    #     params.require(:player).permit(:name)
    # end
end