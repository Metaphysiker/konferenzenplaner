class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new,:edit, :create, :update, :destroy]


  def index
    @events = Event. all
  end

  def show

  end

  def new
    @event = Event.new
  end

  def edit

  end

  def create
    params[:event][:tag_list] = params[:event][:tag_list].join(',')
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      flash[:success] = "Der Event wurde erstellt!"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def update
    params[:event][:tag_list] = params[:event][:tag_list].join(',')
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to calendar_show_path
  end

end


private

def event_params
  params.require(:event).permit(:title, :description, :tag_list)
end

def find_event
  if params[:event_id].nil?
    @event = Event.find(params[:id])
  else
    @event = Event.find(params[:event_id])
  end
end

def find_eventcreate
  @event = Event.find(params[:event_id])
end

