class Api::V1::FacilitiesController < Api::V1::ApiController

  def index
    return render_error 'Must enter latitude and longitude.' if params[:lat].blank? || params[:long].blank?

    radius = params[:radius] || 50

    facilities = Facility.within(params[:lat], params[:long], radius)

    render json: facilities
  end

end
