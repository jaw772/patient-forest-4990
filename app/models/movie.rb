class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors
  def average_age
    self.actors.sum(:age).to_f / self.actors.count
  end

end
