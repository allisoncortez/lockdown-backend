class Api::V1::GamesController < ApplicationController
    def index
        games = Game.all 
        render json: games
    end

    def create
        player = Player.find_or_create_by(name: params[:player_name])
        game = Game.new(player: player, score: params[:score])
        if game.save
            render json: game, include: [:player], status:200
        else
            render json: {errors: game.errors.full_messages}, status: :unprocessible_entity
        end
    end

end
