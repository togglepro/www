class HomeController < ApplicationController
  def index
    @customer_interest = CustomerInterest.new
    @team_interest = TeamInterest.new
  end
end
