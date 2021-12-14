class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors
  def average_age
    self.actors.sum(:age).to_f / self.actors.count
  end
  def search_by_name_threshold(search)
   Actor.where("name iLIKE ?","%" + search + "%")
 end

end
