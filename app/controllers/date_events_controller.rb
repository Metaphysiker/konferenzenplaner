class DateEventsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit, :create, :update, :destroy]
  respond_to :html, :js

  def new
    @possibility = Possibility.find_by_id(params[:possibility_id])
    @dateevent = DateEvent.new
    @datelist = "Test"
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @first_calendar_day = @date.beginning_of_month.beginning_of_week(:monday)
    @last_calendar_day = @date.end_of_month.end_of_week(:monday)
    @weeks = (@first_calendar_day..@last_calendar_day).to_a.in_groups_of(7)

  end

  def create
    @possibility = Possibility.find_by_id(params[:possibility_id])
    @datelist = params[:date].split(",")
    @datelist.each do |date|
      params[:date_event][:date] = date
      @dateevent = DateEvent.new(dateevents_params)
      @dateevent.possibility_id = @possibility.id
      @dateevent.save
    end
    redirect_to root_path
  end
end

private

def dateevents_params
  params.require(:date_event).permit(:date)
end


