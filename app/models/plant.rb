class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_attachment :photo

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :height, numericality: true, allow_blank: true
  validates :photo, presence: true
  validates :location, presence: true
end
