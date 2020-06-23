class Api::V1::PlayersController < ApplicationController
    def index
        players = Player.all 
        render json: PlayerSerializer.new(players), status: :accepted
    end

    def create
        player = Player.new(name: params[:player_name])
        if player.save
            render json: PlayerSerializer.new(player), status: :accepted
        else 
            render json: {errors: player.errors.full_messages}, status: :unprocessible_entity
        end
    end

end