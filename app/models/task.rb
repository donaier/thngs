class Task < ApplicationRecord
  belongs_to :list, optional: true
  scope :orphans, -> { where(list_id: nil) }
  validates :text, presence: true

  def self.listed
    order(flg_tomorrow: :asc).order(nbr_prio: :desc)
  end
end
