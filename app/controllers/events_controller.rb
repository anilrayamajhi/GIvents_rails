class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.order("created_at DESC")
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new({
      e_name:params[:event][:e_name], e_address:params[:event][:e_address]}, e_date:params[:event][:e_date],
      e_time:params[:event][:e_time],
      e_description:params[:event][:e_description])

      if @event.save
        redirect_to root_path(@event)
      else
        redirect_to new_event_path
      end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
      @event.destroy
      redirect_to events_path
    end

    private
  def event_params
    params.require(:event).permit(:e_name, :e_address, :e_description)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
