module EventsHelper
  def allnotconfirmed?(event)
    event.possibilities.each do |poss|
      if poss.confirmed == true
        return false
      end
    end
    return true
  end
end
