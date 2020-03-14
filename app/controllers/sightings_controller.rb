class SightingsController < ApplicationController

  def index 
    sightings = Sighting.all 
    render json: sightings.to_json(inlcude: [:bird, :location])
  end


  def show
    sighting = Sighting.find(params[:id])

    if sighting
    render json: sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
    else
      render json: {messages: "sighting not found"}
    end
  end
end


# class SightingsController < ApplicationController
#   def show
#     sighting = Sighting.find(params[:id])
#     render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
#   end
# end
