class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy]
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to events_path
    else

      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :starting_time, :ending_time, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
