class PinsController < ApplicationController
  def index
    pins = Pin.search(search_params.to_h.symbolize_keys)

    if pins
      render json: {
        status: :found,
        pins: pins
      }
    else 
      render json: {
        status: 500
      }
    end
  end

  def create
    pin = Pin.create!(
      latitude: params['pin']['lat'],
      longitude: params['pin']['long'],
      name: params['pin']['title'],
      description: params['pin']['description']
    )

    if pin
      render json: {
        status: :created,
        pin: pin
      }
    else
      render json: {
        status: 500
      }
    end

  end

  private

  def search_params
    params.permit(:min_lng, :max_lng, :min_lat, :max_lat)
  end
end