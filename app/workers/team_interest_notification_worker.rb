class TeamInterestNotificationWorker
  include Sidekiq::Worker

  def perform(team_interest_id)
    @team_interest = TeamInterest.find_by(id: team_interest_id)

    return :record_not_found unless @team_interest

    TeamInterestNotificationMailer.email(@team_interest).deliver
  end

end
