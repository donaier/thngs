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
    if home_board_id
      Board.find(home_board_id)
    else
      boards.first
    end
  end
end
