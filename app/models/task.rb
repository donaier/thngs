class Task < ApplicationRecord
  belongs_to :list, optional: true
  scope :orphans, -> { where(list_id: nil) }
  validates :text, presence: true
end
