class KalenderController < ApplicationController

  def kalender
    @categories = Group.all
    @tags = ["Logik", "Metaphysik", "Ethik"]
    @tag = params[:search_input]
    if @tag.nil? || @tag.empty? || @tag == "Alle Events"
      @events = Event.all
    else
      #eventsresult = Event.where("name ILIKE ? OR content ILIKE ?", "%#{inputword}%", "%#{inputword}%")
      @events = Event.tagged_with("?", "%#{params[:search_input]}%")
    end

    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    @first_calendar_day = @date.beginning_of_month.beginning_of_week(:monday)
    @last_calendar_day = @date.end_of_month.end_of_week(:monday)
    @weeks = (@first_calendar_day..@last_calendar_day).to_a.in_groups_of(7)
    # @eventics = Event.where('extract(month from date) = ?', @date.month).order(:date)
    # @eventics= Event.joins(:date_events).where('extract(month from date) = ?', @date.month).order(:date)
    @eventics = Event.joins(:date_events).where('extract(month from date_events.date) = ?', @date.month).where(published: true)
    @alldays = (@first_calendar_day..@last_calendar_day)
  end


end



def test
  return true
end



