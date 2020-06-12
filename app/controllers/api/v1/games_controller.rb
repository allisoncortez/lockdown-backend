class Api::V1::GamesController < ApplicationController
    def index #GET /games
        games = Game.all 
        render json: GameSerializer.new(games)
    end

    def create #POST /games
        player = Player.find_or_create_by(name: params[:player_name])
        game = Game.new(player: player, score: params[:score])
        if game.save
            render json: game, include: [:player], status:200
            # render json: GameSerializer.new(game,player), status:200
        else
            render json: {errors: game.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def show 
        # player = Player.find_by(id: params[:id])
        game = Game.find_by(id: params[:id])
        render json: GameSerializer.new(game)
    end

    def update #PATCH
        # binding.pry
        # player = Player.find_by(id: params[:id])
        game = Game.find_by(id: params[:id])

        if game.update(game_params)
            render json: game, status:200
        else
            render json: {errors: game.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def top_score
        top_score = Game.top_score()
        render json: top_score, status: 200
      end
    
      def top_scores
        top_five = Game.top_scores()
        render json: top_five, include: [:player], status: 200
      end

      private 

      def game_params
        params.require(:game).permit(:score)
      end

end
