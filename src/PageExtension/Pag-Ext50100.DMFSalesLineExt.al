pageextension 50100 "DMF Sales Line Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Media Code"; Rec."Media Code")
            {
                ApplicationArea = All;
                Caption = 'Mediekode';
                ToolTip = 'Vælg medietype for den aktuelle linje';

                trigger OnLookup(var Text: Text): Boolean
                var
                    DMFMedia: Record "DMF Media Publishing Date";
                    DMFMediaList: Page "DMF Media Dates";
                    SalesHeader: Record "Sales Header";
                begin
                    if not SalesHeader.Get(Rec."Document Type", Rec."Document No.") then
                        SalesHeader."Order Date" := WorkDate();
                    DMFMedia.SetFilter("Publish Date", '%1..', SalesHeader."Order Date");
                    DMFMediaList.LookupMode(true);
                    DMFMediaList.SetTableView(DMFMedia);
                    if DMFMediaList.RunModal() = Action::LookupOK then begin
                        DMFMediaList.GetRecord(DMFMedia);
                        Rec.Validate("Media Code", DMFMedia."Media Code");
                        Rec.CalcFields("Publish Date", "Dispatch Date");
                    end;
                end;
            }
            field("Publish Date"; Rec."Publish Date")
            {
                ApplicationArea = All;
                Caption = 'Udgivelsesdato';
                Editable = false;

            }
            field("Dispatch Date"; Rec."Dispatch Date")
            {
                ApplicationArea = All;
                Caption = 'Forsendelsesdato';
                Editable = false;
            }
        }
    }
}
