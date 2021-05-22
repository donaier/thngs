class List < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort

  default_scope { order(:sort) }

  validates :title, presence: true
  belongs_to :board
  has_many :tasks
  has_many :lnks
end
