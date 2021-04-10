class Board < ApplicationRecord
  validates :title, presence: true
  has_many :lists
  has_many :tasks
  has_many :lnks

  def orphan_tasks
    tasks.where(list_id: nil)
  end

  def orphan_lnks
    lnks.where(list_id: nil)
  end
end
