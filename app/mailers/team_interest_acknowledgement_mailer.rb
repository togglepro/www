class TeamInterestAcknowledgementMailer < ActionMailer::Base

  def email(team_interest)
    @team_interest = team_interest
    mail(to: team_interest.email, subject: "Thanks for Your Interest")
  end

end
