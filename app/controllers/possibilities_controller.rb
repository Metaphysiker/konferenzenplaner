class PossibilitiesController < ApplicationController
    before_action :find_possibility, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new,:edit, :create, :update, :destroy]
    before_action :cancurrentuserconfirm?, only: :confirm


    def create
      @possibility = Possibility.new
      @possibility.event_id = params[:event_id]
      event = Event.find(params[:event_id])
      if event.possibilities.length == 0
        @possibility.number = 1
      else
        poss = Possibility.where(event_id: params[:event_id]).order(:number)
        @possibility.number = poss.first.number + 1
      end
      @possibility.number = event.possibilities.length + 1

      if @possibility.save

      else
        render 'new'
      end
      redirect_to new_possibility_date_event_path(@possibility)
    end

    def confirm
      @possibility = Possibility.find(params[:possibility_id])
      if @possibility.confirmed == true
        @possibility.confirmed = false
        @possibility.save
        redirect_to kalender_path
        else
          @possibility.confirmed = true
          @possibility.save
          redirect_to kalender_path
      end
    end

    def update
      if @possibility.update(possibility_params)
        redirect_to root_path
      else
        render 'edit'
      end
    end

    def destroy
      @possibility.destroy
      redirect_to event_path(Event.find(@possibility.event_id))
    end

  end

  private

  def possibility_params

  end

  def find_possibility
    @possibility = Possibility.find(params[:id])
  end

def cancurrentuserconfirm?

  @possibility = Possibility.find(params[:possibility_id])
  event = Event.find(@possibility.event_id)
  userid = event.user_id
  if current_user.id != event.user_id
    redirect_to root_path
  end
end
