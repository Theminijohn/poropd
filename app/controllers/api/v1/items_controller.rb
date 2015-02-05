module Api
  module V1
    class ItemsController < ApplicationController
      respond_to :json

      def index
        @items = Item.all
      end

    end
  end
end