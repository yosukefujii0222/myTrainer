class Follower < ApplicationRecord
  validates :trainer_id, {presence: true}
  validates :user_id, {presence: true}
  validates :status, {presence: true}

  def trainer
    return Trainer.find_by(id: self.trainer_id)
  end

  def user
    return User.find_by(id: self.user_id)
  end

end
