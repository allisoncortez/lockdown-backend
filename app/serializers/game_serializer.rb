class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :score, :player_id, :player
end
