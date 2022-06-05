with Ada.Text_IO; use Ada.Text_IO;
with Rozwiazanie;

procedure Main is
   use Rozwiazanie;

   serwer : SerwerSzkolen( 10, 3 );

   task type Pierwszy is
      entry Przekaz;
   end Pierwszy;

   ttp: array (1..10) of Pierwszy;

   task body Pierwszy is
      id: integer := 1;
      rozmiar : integer;
      inni : ListaUczestnikow;
   begin
      Put_Line( "przed zapisem" );
      serwer.Zapisz( id );
      Put_Line( "po zapisie" );

      serwer.Dolacz( id, rozmiar, inni );
      Put_Line( "po dolaczeniu" );

      serwer.Opusc( id );
      Put_Line( "po opuszczeniu" );
   end Pierwszy;

begin
   null;
end Main;
