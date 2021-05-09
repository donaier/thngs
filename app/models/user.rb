class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :registerable, :recoverable, :rememberable,
  devise :database_authenticatable, :validatable

  has_many :lists, foreign_key: 'owner'
  has_many :boards, foreign_key: 'owner'

  def toggle_help
    self.toggle!(:wants_help)
  end

  def home_board
    if (board_time == 'always') || ((board_time == 'weekends' && [1,2,3,4,5].include?(Time.now.wday)) || (board_time == 'healthy weekends' && [1,2,3,4].include?(Time.now.wday)))
      if home_board_id && Board.exists?(home_board_id)
        Board.find(home_board_id)
      else
        boards.first
      end
    elsif (extra_board_id ) && ((extra_time == 'weekends' && [0,6].include?(Time.now.wday)) || (extra_time == 'healthy weekends' && [0,5,6].include?(Time.now.wday)))
      Board.find(extra_board_id)
    else
      boards.first
    end
  end
end
