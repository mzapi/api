module Api::V1
  class ApiController < ApplicationController
    include ActionController::Serialization

    def meta_for(object)
      meta = {}

      if object.respond_to?("total_pages")
        meta[:page] = params[:page] || 1
        meta[:per_page] = params[:per_page] || 20
        meta[:total_pages] = object.total_pages
      end

      meta
    end

    def respond_with(object = nil, options = {})
      meta = meta_for(object)
      if meta.keys.length < 1
        render json: object, status: options[:status]
      else
        render json: object, meta: meta_for(object), status: options[:status]
      end

    end

  end
end
