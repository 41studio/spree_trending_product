module Spree
  class CityChange < Spree::Base
    belongs_to :user, class_name: Spree.user_class.to_s, optional: true
    belongs_to :cityful, polymorphic: true

    def <=>(other)
      created_at <=> other.created_at
    end
  end
end
