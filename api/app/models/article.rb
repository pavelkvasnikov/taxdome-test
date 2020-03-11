#
class Article < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :delete_all

  validates :name, presence: true
end
