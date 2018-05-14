class Api::V1::TeamsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def show
    render json: Race.find(params["id"]).teams
  end

  def create
    binding.pry
    Registration.create!(race_id: params["race_id"], user: current_user)
    newTeam = Team.create!(
      name: params["newTeamName"],
      motto: params["newTeamMotto"],
      race_id: params["race_id"]
    )

    Roster.create!(user: current_user, team: newTeam)
  end
end
