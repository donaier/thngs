class List < ApplicationRecord
  belongs_to :board
  has_many :tasks
  has_many :lnks
  validates :title, presence: true
end
