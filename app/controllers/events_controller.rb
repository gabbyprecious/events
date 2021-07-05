class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        # @event = current_user.events.new(event_params)
        @event = Event.new(event_params.merge(user_id: current_user.id))

        if @event.save
            redirect_to @event
        else
            render :new
        end
    end

    private
    def event_params
      params.require(:event).permit(:title, :description, :status, :price)
    end
end
