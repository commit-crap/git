json.array!(@teams) do |team|
  json.extract! team, :id, :name, :description, :status, :icon
  json.url admin_team_url(team, format: :json)
end
