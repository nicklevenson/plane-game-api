class Score < ApplicationRecord
  belongs_to :user

  def self.high_scores 
    all.order(score: :asc).collect{|s|"#{s.user.username}: #{s.score}"}
  end
end
