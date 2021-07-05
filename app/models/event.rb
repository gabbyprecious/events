class Event < ApplicationRecord
    belongs_to :user

    before_save do
        if event_is_free?
            self.price = 0
        end
    end

    validates_presence_of :title, :status, :description
    validates :price, absence: {message: "must be empty if event is free please" }, if: :event_is_free?

    def event_is_free?
        status == "free"
    end 
end
