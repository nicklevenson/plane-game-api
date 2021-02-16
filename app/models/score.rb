class Score < ApplicationRecord
  belongs_to :user

  def self.high_scores 
    all.order(created_at: :asc).reorder(score: :desc).collect{|s|"#{s.user.username}: #{s.score}"}.take(25)
  end
end
