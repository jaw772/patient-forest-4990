class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors
  def average_age
    self.actors.average(:age)
  end

end
