class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :check_event, only: [:edit, :destroy]

  def index
    @events = Event.all.order("created_at DESC")
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

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

  def find_event
    @event = Event.find(params[:id])
  end

  def check_event
    if @event.user == current_user
    else
      flash[:error] = "Edit only your event!!"
      redirect_to root_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:e_name, :e_address, :e_description, :e_datetime, :user_id, :photo)
  end

  # {e_name: "Potluck", e_address: "1520 2nd St.", e_description: "A fun afternoon!", e_datetime: "Sept 22, 2016 4:00", admin: true}
  # becomes:
  # {e_name: "Potluck", e_address: "1520 2nd St.", e_description: "A fun afternoon!", e_datetime: "Sept 22, 2016 4:00"}


end
