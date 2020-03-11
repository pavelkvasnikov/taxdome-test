class Task < ApplicationRecord
  belongs_to :article

  validates :title, presence: true
end
