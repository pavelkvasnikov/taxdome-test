class Board < ApplicationRecord
  has_many :articles

  validates :name, presence: true
  validates :link, presence: true
  validates :name, uniqueness: true
  validates :link, uniqueness: true
end
