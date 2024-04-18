class VolunteerSearch
  include SearchObject.module(:sorting)

  option(:volunteer_team_id) { |scope, value| scope.joins(:volunteer_team).where volunteer_team: {id: value} }

  sort_by "name"
  config[:defaults]["sort"] = "#{config[:sort_attributes].first} asc"
end
