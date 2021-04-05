class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :registerable, :recoverable, :rememberable,
  devise :database_authenticatable, :validatable

  has_many :lists, foreign_key: 'owner'

  def toggle_help
    self.toggle!(:wants_help)
  end
end
