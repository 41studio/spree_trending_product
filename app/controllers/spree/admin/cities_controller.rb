module Spree
  module Admin
    class CitiesController < ResourceController
      belongs_to 'spree/state'
      before_action :load_data

      def index
        respond_with(@collection) do |format|
          format.html
          format.js { render partial: 'city_list' }
        end
      end

      protected

      def location_after_save
        admin_state_cities_url(@state)
      end

      def collection
        super.order(:name)
      end

      def load_data
        @states = State.order(:name)
      end
    end
  end
end
