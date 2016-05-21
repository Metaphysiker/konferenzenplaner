class PossibilitiesController < ApplicationController
    before_action :find_possibility, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new,:edit, :create, :update, :destroy]
    before_action :iscurrentuserallowed?, only: [:edit, :update, :destroy]



    def create
      @possibility = Possibility.new
      @possibility.event_id = params[:event_id]

      if @possibility.save
        redirect_to new_event_possibility_date_event_path(params[:event_id],@possibility)
      else
        render 'new'
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
      redirect_to root_path
    end

  end


  private

  def possibility_params

  end

  def find_possibility
    @possibility = Possibility.find(params[:id])
  end

  def iscurrentuserallowed?
    if !current_user.id == @possibility.user_id
      redirect_to root_path
    end
  end
