class Api::V1::ResourcesController < ApplicationController
  def show
    resources = ResourceFacade.videos(params[:country])
    if resources == []
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
    else
      render json: ResourceSerializer.new(resources)
    end
  end
end
