-- Michał Cyran
--with Ada.Text_IO; use Ada.Text_IO;
package body Rozwiazanie is

   task body SerwerSzkolen is
      trwaSpotkanie : Integer := 0;
      jestGrupa : Integer := 0;
      zapisani : Integer := 0;
      przeszkoleni : Integer := 0;
      listaZapisanych : ListaUczestnikow;

      dolaczeniDoSpotkania : Integer := 0;
      obecnyRozmiar : Integer := 0;

   begin
      loop 

         --Put_Line( "looping" );
         exit when (przeszkoleni >= maxPracownikow and trwaSpotkanie = 0 and dolaczeniDoSpotkania = 0); 

         if (jestGrupa = 0 and trwaSpotkanie = 0) then
               --Put_Line( "case 1" );
               accept Zapisz( id: Integer ) do

                  --Put_Line( "zapisano task" );

                  zapisani := zapisani + 1;
                  listaZapisanych( zapisani ) := id;

                  -- rozmiar ostatniej grupy
                  obecnyRozmiar := maxPracownikow - przeszkoleni;
                  if (obecnyRozmiar > maxWSzkoleniu) then
                     obecnyRozmiar := maxWSzkoleniu;
                  end if;

                  --Put_Line( Integer'Image( obecnyRozmiar ) );

                  
                  if (zapisani = obecnyRozmiar) then
                     jestGrupa := 1;
                     --Put_Line( "stworzono grupe" );
                  end if;

               end;

         elsif (jestGrupa = 1 and trwaSpotkanie = 0) then
               --Put_Line( "case 2" );
                  accept Dolacz( id: Integer; rozmiar: out Integer; uczestnicy: out ListaUczestnikow ) do
                     dolaczeniDoSpotkania := dolaczeniDoSpotkania + 1;

                     for variable in 1 .. obecnyRozmiar loop
                        uczestnicy( variable ) := listaZapisanych( variable );
                     end loop;

                     przeszkoleni := przeszkoleni + 1;

                     rozmiar := obecnyRozmiar;

                     if (dolaczeniDoSpotkania = obecnyRozmiar) then
                        trwaSpotkanie := 1;
                        jestGrupa := 0;
                        zapisani := 0;
                     end if;
                  end;

         elsif (jestGrupa = 0 and trwaSpotkanie = 1) then
               --Put_Line( "case 3" );
            select 
            accept Opusc( id: Integer ) do
                  dolaczeniDoSpotkania := dolaczeniDoSpotkania - 1;

                  if (dolaczeniDoSpotkania = 0) then
                     trwaSpotkanie := 0;
                  end if;
               end;
               
            or
            accept Zapisz( id: Integer ) do

                  zapisani := zapisani + 1;
                  listaZapisanych( zapisani ) := id;

                  -- rozmiar ostatniej grupy
                  obecnyRozmiar := maxPracownikow - przeszkoleni;
                  if (obecnyRozmiar > maxWSzkoleniu) then
                     obecnyRozmiar := maxWSzkoleniu;
                  end if;
                  
                  if (zapisani = obecnyRozmiar) then
                     jestGrupa := 1;
                  end if;

               end;
               
            end select;

         else
               --Put_Line( "case 4" );
               accept Opusc( id: Integer ) do
                  dolaczeniDoSpotkania := dolaczeniDoSpotkania - 1;

                  if (dolaczeniDoSpotkania = 0) then
                     trwaSpotkanie := 0;
                  end if;
               end;

         end if;

      end loop;
   end SerwerSzkolen;

end Rozwiazanie;
