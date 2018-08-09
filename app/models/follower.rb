class Follower < ApplicationRecord
  validates :trainer_id, {presence: true}
  validates :user_id, {presence: true}
  validates :status, {presence: true}
end
