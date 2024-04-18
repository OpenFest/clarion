require "rails_helper"

feature "Volunteering" do
  include ActiveJob::TestHelper

  before do
    Rails.application.load_seed
    sign_in_as_admin
    create_new_conference
    sign_out
  end

  scenario "A user applies to be a volunteer for the upcoming conference" do
    visit root_path
    click_on I18n.t("views.volunteers.apply")

    perform_enqueued_jobs do
      fill_in_volunteer_profile
      expect(page).to have_content I18n.t("views.volunteers.successful_application")
      expect(page).to have_content I18n.t("views.volunteers.email_not_confirmed")
    end

    perform_enqueued_jobs do
      visit link_from_last_email
    end

    expect(page).not_to have_content I18n.t("views.volunteers.email_not_confirmed")

    expect(ActionMailer::Base.deliveries.last.subject).to eq(I18n.t("volunteer_mailer.success_notification.subject", conference_name: "FooConf #{1.year.from_now.year}"))

    sign_in_as_admin
    click_on_first_conference_in_management_root
    click_on I18n.t("activerecord.models.volunteership", count: 2).capitalize
    expect(page).to have_content "Volunteer Foo"
  end

  private

  def link_from_last_email
    ActionMailer::Base.deliveries.last.body.to_s.strip[%r{(?<=https://www\.example\.com).*?(?=$)}]
  end
end
