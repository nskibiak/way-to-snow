class ResortsController < ApplicationController
  before_action :validate_user

  def validate_user
    @user = current_user
  end

  def index
    if params[:slopes_length].present?
      @resorts = Resort.where('slopes_length > ?', 10)
    elsif params[:snow].present?
      @resorts = Resort.where('snow_change > ?', 0)
    elsif params[:favorites].present?
      if @user.favorites.any?
        @resorts = @user.resorts
      else
        flash.now[:alert] = "You don't have any favorite resorts yet!"
      end
    else
      @resorts = Resort.where.not(latitude: nil, longitude: nil)
    end
    map_maker(@resorts)
  end

  def map_maker(resorts)
    @markers = resorts.map do |resort|
      {
        lat: resort.latitude,
        lng: resort.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { resort: resort }),
        image_url: helpers.asset_url('marker.png')
      }
    end
  end

  def show
    @resort = Resort.find(params[:id])
  end
end
