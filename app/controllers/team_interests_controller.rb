class TeamInterestsController < ApplicationController
  def create
    @team_interest = TeamInterest.new(team_interest_params)
    if @team_interest.save
      TeamInterestNotificationWorker.perform_async(@team_interest.id)
      flash[:notice] = "Thanks for your interest in joining the team. We'll be in touch."
    else
      flash[:error] = "There were errors in your form. #{@team_interest.errors.full_messages.collect { |e| e + "." }.join(" ")}"
    end
    redirect_to root_path
  end

private
  def team_interest_params
    params.require(:team_interest).permit(:name, :email, :content)
  end
end
