class VolunteerMailer < ActionMailer::Base
  def team_notification(new_volunteer)
    @volunteer = new_volunteer

    mail(
      to: @volunteer.conference.email,
      subject: "Нов доброволец за #{@volunteer.conference.title}"
    )
  end

  def volunteer_notification(new_volunteer)
    @volunteer = new_volunteer
    I18n.locale = @volunteer.language
    mail(to: @volunteer.email,
         reply_to: @volunteer.conference.email,
         from: "OpenFest <cfp@openfest.org>",
         subject: I18n.t("volunteer_mailer.success_notification.subject",
           conference_name: @volunteer.conference.title))
  end

  def volunteer_email_confirmation(new_volunteer)
    @volunteer = new_volunteer
    I18n.locale = @volunteer.language
    mail(to: @volunteer.email,
         reply_to: @volunteer.conference.email,
         from: "OpenFest <cfp@openfest.org>",
         subject: I18n.t("volunteer_mailer.email_confirmation.subject",
                         conference_name: @volunteer.conference.title))
  end

end
