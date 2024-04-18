class Volunteer < ActiveRecord::Base
  TSHIRT_SIZES = [:s, :m, :l, :xl, :xxl, :xxxl]
  TSHIRT_CUTS = [:unisex, :female]
  FOOD_PREFERENCES = [:none, :vegetarian, :vegan]

  has_one_attached :picture

  validates :name, :language, :tshirt_size, :tshirt_cut, :food_preferences, presence: true
  validates :tshirt_size, inclusion: {in: TSHIRT_SIZES.map(&:to_s)}
  validates :tshirt_cut, inclusion: {in: TSHIRT_CUTS.map(&:to_s)}
  validates :food_preferences, inclusion: {in: FOOD_PREFERENCES.map(&:to_s)}
  validates :email, format: {with: /\A[^@]+@[^@]+\z/}, presence: true, uniqueness: {scope: :conference_id}
  validates :phone, presence: true, format: {with: /\A[+\- \(\)0-9]+\z/}
  validates :volunteer_team, presence: true
  validate :volunteer_teams_belong_to_conference

  phony_normalize :phone, default_country_code: "BG"

  belongs_to :conference
  belongs_to :volunteer_team
  has_and_belongs_to_many :additional_volunteer_teams, class_name: "VolunteerTeam"

  before_create :ensure_main_volunteer_team_is_part_of_additional_volunteer_teams
  before_create :assign_unique_id
  before_create :assign_confirmation_token
  after_commit :send_email_confirmation_to_volunteer, on: [:create]

  def send_notification_to_volunteer
    VolunteerMailer.volunteer_notification(self).deliver_later
  end

  private

  def ensure_main_volunteer_team_is_part_of_additional_volunteer_teams
    self.additional_volunteer_teams |= [volunteer_team] if volunteer_team
  end

  def assign_unique_id
    self.unique_id = Digest::SHA256.hexdigest(SecureRandom.uuid)
  end

  def assign_confirmation_token
    self.confirmation_token = Digest::SHA256.hexdigest(SecureRandom.uuid)
  end

  def send_email_confirmation_to_volunteer
    VolunteerMailer.volunteer_email_confirmation(self).deliver_later
  end

  def volunteer_teams_belong_to_conference
    conference_volunteer_teams = conference.volunteer_teams
    unless additional_volunteer_teams.all? { |team| conference_volunteer_teams.include? team }
      errors.add :additional_volunteer_teams, :invalid_volunteer_team
    end
    unless conference_volunteer_teams.include?(volunteer_team)
      errors.add :volunteer_team, :invalid_volunteer_team
    end
  end
end
