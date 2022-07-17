class CampersController < ApplicationController
  wrap_parameters format:[]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def index
    campers = Camper.all
    render json: campers 
  end

  def show
    camper = find_camper
    render json: camper, serializer: CamperActivitySerializer
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private 

  def find_camper 
    Camper.find(params[:id])
  end

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found_response
    render json: { error: "Camper not found" }, status: :not_found
  end

  def render_invalid_response invalid
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end

end
