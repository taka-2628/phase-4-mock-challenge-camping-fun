class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def create
    signup = Signup.create!(signup_params)
    activity = Activity.find(signup_params[:activity_id])
    render json:activity, status: :created
  end

  private 

  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end

  def render_invalid_response
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end
  
end
