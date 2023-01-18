class Api::V1::ResourcesController < ApplicationController
  def show
    resources = ResourceFacade.videos(params[:country])
    if resources == []
      no_resources_found
    else
      render json: ResourceSerializer.new(resources)
    end
  end
end

private

def no_resources_found
  render json: {
    "data": {
      "id": nil,
      "type": 'learning_resource',
      "attributes": {
        "country": "#{params[:country]}",
        "video": {},
        "images": []
      }
    }
  }
end
