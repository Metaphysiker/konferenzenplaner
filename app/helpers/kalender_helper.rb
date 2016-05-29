module KalenderHelper

  def konflikt?(event, possibility)

    konflikte = Array.new
      possibility.date_events.each do |date|
        @events.each do |databaseevent|
          databaseevent.possibilities.each do |databaseposs|
            databaseposs.date_events.each do |databasedate|
              if event != databaseevent
                if date.date == databasedate.date
                 if allnotconfirmed?(databaseevent)
                   konflikte.push([databaseevent,databasedate.date])
                  elsif databaseposs.confirmed == true
                   konflikte.push([databaseevent,databasedate.date])
                 else

                 end
                end
              end
            end
          end
        end
      end
    return konflikte
  end

  def konfliktdate?(event, possibility, datum)

    konflikte = Array.new
      @events.each do |databaseevent|
        databaseevent.possibilities.each do |databaseposs|
          databaseposs.date_events.each do |databasedate|
            if event != databaseevent
              if datum.date == databasedate.date
                if allnotconfirmed?(databaseevent)
                  konflikte.push(databaseevent)
                elsif databaseposs.confirmed == true
                  konflikte.push(databaseevent)
                else

                end
              end
            end
          end
        end
      end
    return konflikte
  end

end
