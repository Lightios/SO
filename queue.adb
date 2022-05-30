task Queue is
  entry Wait
  entry Signal
end

task body Queue is
begin
  loop
    accept Wait do
      accept Signal do end
    end

    -- wersja 2;
    --accept Signal do end
    --accept Wait do end 
  end loop
end


task Queue2 is
  entry Wait
  entry Signal
end

task body Queue2 is
  ldp: integer := 0
begin
  select
    accept Signal do ++ldp end
  or
    when ldp > 0 =>
      accept Wait do --ldp end
  end select
end

task T1 is

end

task body T1 is
  begin
    Queue.Wait()
  end

task T2 is

end

task body T2 is
  begin
    Queue.Signal()
  end



-----------------------------------------------------------------------------------------------------------------------------

task type Kolejka is
  entry Wait( x: out integer )
  entry Signal( y: in integer )
end

task body Kolejka is
  loop
    accept Wait( x: out integer ) do
      accept Signal( y: in integer ) do x = y end
    end

  end loop
end


TQ: array( 1 ... MAXP ) of Q;


task Klient is
  priorytet: integer
  id: integer
end

task body Klient is
begin
  ZarządcaDrukarek.Żądanie( priorytet )
  TQ.Wait( id )
  Drukowanie( id )
  ZarządcaDrukarek.Zwolnienie( id )
end



task ZarządcaDrukarek is
  entry Żądanie( priorytet: in integer )
  entry Zakolejkowanie( id: in integer )
  entry Zwolnienie( id: in integer )
end

task body ZarządcaDrukarek is
  TWD: array( 1 ... MAXD ) of Bool
  TCK: integer( 1 ... MAXP ) of integer
  LWD: integer := MAXD
  LCK: int := 0
begin
  loop
      select
        accept Żądanie( priorytet: in integer ) do
          ++tck( priorytet )
        end

        if (lwd > 0) then
          id := pierwsza_wolna_drukarka( TWD )
          TQ( priorytet ).Signal( id )
          TWD( id ) := False
          --LWD
          --LCK
          --TCK( priorytet )
        end

      or
        accept Zwolnienie( id: in integer ) do


      end select
  end loop
end