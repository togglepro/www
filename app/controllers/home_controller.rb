class HomeController < ApplicationController
  def index
    @team_interest = TeamInterest.new
  end
end
