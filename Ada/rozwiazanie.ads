package Rozwiazanie is
   maxPracownikow: constant Integer:= 10;
   maxWSzkoleniu: constant Integer:= 3;

   type ListaUczestnikow is array(1..maxWSzkoleniu) of Integer;

   task type SerwerSzkolen(liczbaPracownikow: Integer; rozmiarGrupy: Integer) is
      entry Zapisz(id: Integer);
      entry Dolacz(id: Integer; rozmiar: out Integer; uczestnicy: out ListaUczestnikow);
      entry Opusc(id: Integer);
   end SerwerSzkolen;

end Rozwiazanie;
