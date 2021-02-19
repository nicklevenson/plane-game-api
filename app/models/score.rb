class Score < ApplicationRecord
  belongs_to :user

  def self.high_scores 
    all.order(score: :desc, created_at: :asc).collect{|s|"#{s.user.username}: #{s.score}"}.take(25)
  end

  def self.high_score_instances 
    all.order(score: :desc, created_at: :asc).take(25)
  end

  def self.pick_hs 
    Score.all.order(score: :desc, created_at: :asc).select{|s| Score.high_score_instances.include?(s)}
  end

  def self.select_delete_scores
    Score.all.select{|s| !(Score.high_score_instances.include?(s))}
  end
end
