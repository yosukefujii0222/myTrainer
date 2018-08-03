class Trainer < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  validates :speciality, {presence: true}
  validates :gennder, {presence: true}
  validates :height, {presence: true}
  validates :weight, {presence: true}
  validates :age, {presence: true}
end
