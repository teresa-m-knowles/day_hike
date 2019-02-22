class Trip < ApplicationRecord
  validates_presence_of :name;
  validates_presence_of :start_date;
  validates_presence_of :end_date;

  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def total_hiking_distance
    trails.sum(:length)
  end

  def average_miles
    trails.average(:length)
  end

  def longest_trail
    trails.order(length: :desc).first
  end

end
