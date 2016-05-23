module KalenderHelper

  def konflikt?(event, possibility)

    konflikte = Array.new
      possibility.date_events.each do |date|
        @events.each do |databaseevent|
          databaseevent.possibilities.each do |databaseposs|
            databaseposs.date_events.each do |databasedate|
              if event != databaseevent
                if date.date == databasedate.date
                  konflikte.push("Konflikt mit " + databaseevent.title.to_s + ": " + databasedate.date.to_s)
                end
              end
            end
          end
        end
      end
    return konflikte
  end

end
