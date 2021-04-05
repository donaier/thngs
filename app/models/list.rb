class List < ApplicationRecord
  has_many :tasks
  has_many :lnks
  validates :title, presence: true
end
