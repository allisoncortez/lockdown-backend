class PlayerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :player_id, :name
  end