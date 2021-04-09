class HomeController < ApplicationController
  def profile

  end

  def toggle_help
    current_user.toggle_help
  end
end
