class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :score, :player
  # took out player_id
end
