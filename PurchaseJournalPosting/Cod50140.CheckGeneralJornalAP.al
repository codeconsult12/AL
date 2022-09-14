codeunit 50140 CheckGeneralJournalAp
{



    var
        GlSetup: record "General Ledger Setup";

    procedure CheckAP() CheckAPvar: Boolean
    begin
        if GlSetup.FindFirst()
        then begin

            if GlSetup."Close AP"
            then begin
                CheckAPvar := true;
            end
            else begin
                CheckAPvar := false;
            end;




        end
    end;





}
