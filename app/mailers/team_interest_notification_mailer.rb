class TeamInterestNotificationMailer < ActionMailer::Base

  def email(team_interest)
    @team_interest = team_interest
    mail(to: ENV["NOTIFICATION_EMAIL"], subject: "Team Interest Notification")
  end

end
