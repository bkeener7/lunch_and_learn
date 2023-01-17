class Api::V1::ResourcesController < ApplicationController
  def show
    resources = ResourceFacade.videos(params[:country])
    render json: ResourceSerializer.new(resources)
  end
end
