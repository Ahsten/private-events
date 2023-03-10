class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @even = Event.new
    end
    
    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to @event
        else
            render :new, status: :unprocessable_entity
        end
    end

    def event_params
        params.require(:event).permit(:creator_id, 
                                        :title, 
                                        :start_date, 
                                        :end_date, 
                                        :start_time, 
                                        :end_time, 
                                        :locaiton, 
                                        :description)
    end
end
