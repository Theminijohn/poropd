module Api
  module V1
    class AccountsController < ApplicationController
      respond_to :json

      def index
        @accounts = Account.all
      end

    end
  end
end