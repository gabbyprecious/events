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
        @event = Event.new(event_params.merge(user_id: current_user.id))

        if @event.save
            redirect_to @event
        else
            render :new
        end
    end

    def edit
        @event = Event.find_by(id: params[:id], user_id:current_user.id)
    end

    def update
        @event = Event.find_by(id: params[:id], user_id:current_user.id)

        if @event.update(event_params)
            redirect_to @event
        else
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to root_path
    end

    def update_active
        @event = Event.find(params[:id])
        if event.active
            @event.update(:active, false)
        else
            @event.update(:active, false)
        end
    end

    private
    def event_params
      params.require(:event).permit(:title, :description, :status, :price, :active)
    end
end
