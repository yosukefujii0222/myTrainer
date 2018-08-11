class Chat < ApplicationRecord
  validates :body, {presence: true}
  validates :follower_id, {presence: true}
  validates :sender, {presence: true}

  def trainer
    @follower = Follower.find_by(id: self.follower_id)
    return Trainer.find_by(id: @follower.trainer_id)
  end

  def user
    @follower = Follower.find_by(id: self.follower_id)
    return User.find_by(id: @follower.user_id)
  end

end
