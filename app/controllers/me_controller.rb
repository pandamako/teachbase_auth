class MeController < ApplicationController
  skip_before_action :require_login
  skip_before_action :verify_authenticity_token
  before_action :doorkeeper_authorize!

  def index
    render json: { id: current_user.id, email: current_user.email }
  end

private

  def current_user
    if doorkeeper_token
      @current_user ||= User.find(doorkeeper_token.resource_owner_id)
    end
  end
end
