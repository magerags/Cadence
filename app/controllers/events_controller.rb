class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
    if params[:date]
      @dates = Event.events_today(current_user, params[:date])
    else
      @dates = Event.events_today(current_user, Date.today)
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

  def demo
    Event.create!(
      user: current_user,
      name: "Sushi",
      description: "The most exquisite food there is 🍣",
      repeatable: false,
      starting_time: Time.new(2020, 12, 4, 19, 0),
      ending_time: Time.new(2020, 12, 4, 20, 0),
      category: current_user.categories.where(name: "Eating").first
      )

    Event.create!(
      user: current_user,
      name: "Morning run",
      description: "Aim for 5km in 30mins! 🏃‍♂️",
      repeatable: false,
      starting_time: Time.new(2020, 12, 5, 10, 0),
      ending_time: Time.new(2020, 12, 5, 11, 0),
      category: current_user.categories.where(name: "Fitness").first
      )

    Event.create!(
      user: current_user,
      name: "Push day",
      description: "Time to smash the gym 🏋️‍♂️",
      repeatable: false,
      starting_time: Time.new(2020, 12, 5, 11, 0),
      ending_time: Time.new(2020, 12, 5, 12, 30),
      category: current_user.categories.where(name: "Fitness").first
      )

    Event.create!(
      user: current_user,
      name: "Lunch with Henry",
      description: "Get lots of protein in 🍗",
      repeatable: false,
      starting_time: Time.new(2020, 12, 5, 14, 0),
      ending_time: Time.new(2020, 12, 5, 15, 0),
      category: current_user.categories.where(name: "Eating").first
      )

    Event.create!(
      user: current_user,
      name: "Have a nap",
      description: "Time to rest, not too long though 💤",
      repeatable: false,
      starting_time: Time.new(2020, 12, 5, 14, 0),
      ending_time: Time.new(2020, 12, 5, 15, 0),
      category: current_user.categories.where(name: "Relaxing").first
      )

    Event.create!(
      user: current_user,
      name: "Cleaning",
      description: "Yep we all have to do it... 🧼",
      repeatable: false,
      starting_time: Time.new(2020, 12, 6, 12, 0),
      ending_time: Time.new(2020, 12, 6, 14, 0),
      category: current_user.categories.where(name: "Chores").first
      )

    Event.create!(
      user: current_user,
      name: "Pull day",
      description: "Get back in the gym! 💪",
      repeatable: false,
      starting_time: Time.new(2020, 12, 6, 16, 0),
      ending_time: Time.new(2020, 12, 6, 18, 0),
      category: current_user.categories.where(name: "Fitness").first
      )

    Event.create!(
      user: current_user,
      name: "Online CV",
      description: "Keep your coding skills active 💻",
      repeatable: false,
      starting_time: Time.new(2020, 12, 6, 16, 0),
      ending_time: Time.new(2020, 12, 6, 18, 0),
      category: current_user.categories.where(name: "Coding").first
      )

    Event.create!(
      user: current_user,
      name: "Taco night!",
      description: "Combat that sunday night feeling 🌮",
      repeatable: false,
      starting_time: Time.new(2020, 12, 6, 16, 0),
      ending_time: Time.new(2020, 12, 6, 18, 0),
      category: current_user.categories.where(name: "Socialising").first
      )
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :category_id, :description, :starting_time, :ending_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
