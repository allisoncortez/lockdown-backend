class Game < ApplicationRecord
  belongs_to :player

  scope :top_score, ->() {order(score: :desc).limit(1).first}
  scope :top_scores, ->() {order(score: :desc).limit(5)}
end
