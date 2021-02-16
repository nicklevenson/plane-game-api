class Score < ApplicationRecord
  belongs_to :user

  default_scope {order(created_at: :asc).reorder(score: :desc)}

  def self.high_scores 
    all.collect{|s|"#{s.user.username}: #{s.score}"}.take(25)
  end
end
