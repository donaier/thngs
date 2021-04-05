class Lnk < ApplicationRecord
  belongs_to :list, optional: true
  scope :orphans, -> { where(list_id: nil) }
  validates :text, :href, presence: true
end
