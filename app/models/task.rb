class Task < ApplicationRecord
  belongs_to :list, optional: true
  scope :orphans, -> { where(list_id: nil) }
  validates :text, presence: true

  def self.listed
    order(flg_tomorrow: :desc).order(nbr_prio: :desc)
  end

  def completed?
    completed_at != nil
  end

  def tomorrow_class
    if flg_tomorrow && created_at > (Time.now - 1.day)
      'tomorrow'
    elsif flg_tomorrow
      'isnow'
    else
      nil
    end
  end
end
