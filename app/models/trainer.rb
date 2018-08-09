class Trainer < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  validates :speciality, {presence: true}
  validates :gender, {presence: true}
  validates :height, {presence: true}
  validates :weight, {presence: true}
  validates :age, {presence: true}

  def self.search(search)
    if search
      Trainer.where(['name LIKE ?', "%#{search}%"]).or(Trainer.where(['career LIKE ?', "%#{search}%"]))
    else
      Trainer.all
    end
  end

  def self.searchSpeciality(searchSpeciality)
    if searchSpeciality
      Trainer.where(speciality: "[\"#{searchSpeciality}\"]").or(Trainer.where(speciality: "[\"#{searchSpeciality}\", \"workout\"]")).or(Trainer.where(speciality: "[\"meal\", \"#{searchSpeciality}\"]"))
    else
      Trainer.all
    end
  end

end
