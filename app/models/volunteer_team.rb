class VolunteerTeam < ActiveRecord::Base
  belongs_to :conference
  has_many :volunteers, inverse_of: :volunteer_team
  has_and_belongs_to_many :supporters, class_name: "Volunteer", inverse_of: :additional_volunteer_teams

  validates :name, presence: true
  validates :color, presence: true, format: {with: /\A#?[a-f0-9]{6}\z/i}
  validates :description, presence: true

  translates :name, :description

  def include?(volunteer)
    volunteers.include? volunteer
  end

  def color=(hex_triplet)
    write_attribute :color, hex_triplet.gsub(/\A#/, "") if hex_triplet
  end

  def color
    "##{read_attribute :color}"
  end
end
