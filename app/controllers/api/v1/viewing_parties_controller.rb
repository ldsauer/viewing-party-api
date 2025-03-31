class API::V1::ViewingPartiesController < ApplicationController
  def create
    party = ViewingParty.new(viewing_party_params)

    if party.save
      create_invitees(party)
      render json: ViewingPartySerializer.new(party), status: :created
    else
      render json: { errors: party.errors.full_messages }, status: :bad_request
    end
  end

  private
  
  def viewing_party_params
    params.permit(:name, :start_time, :end_time, :movie_id, :movie_title, :host_id)
  end

  def create_invitees(party)
    return unless params[:invitees]

    prarms[:invitees].each do |user_id|
      user = User.find_by(id: user_id)
      if user
        Invitee.create!(user: user, viewing_party: party)
      end
    end
  end
end