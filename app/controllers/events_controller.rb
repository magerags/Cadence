class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
    if params[:date]
      @dates = Event.events_today(current_user, params[:date])

    end
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.category = Category.find(params[:event][:category])
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
    # id, class_name = JSON.parse(params[:event][:category])
    # category = class_name.constantize.find(id)
    # category_class = class_name.downcase == ("category") ? ("category_id") : ("user_categories_id")
    # @event.send("#{category_class}=", category.id)
    @event.update(event_params)
    if params[:date]
      redirect_to events_path(date: params[:date])
    else
      redirect_to events_path
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path(date: params[:date])
  end

  private

  def event_params
    params.require(:event).permit(:name, :category_id, :description, :starting_time, :ending_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
