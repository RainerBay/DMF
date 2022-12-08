tableextension 50100 "DMF Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50100; "Media Code"; Code[20])
        {
            Caption = 'Media Code';
            TableRelation = "DMF Media Publishing Date";
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                DMFMedia: Record "DMF Media Publishing Date";
                SalesHeader: Record "Sales Header";
                MsgTxtLbl: Label 'Ordredato %1 ligger efter %2 %3 på %4.', Comment = '%1=Order Date, %2=Publish Date-field, %3=Date, %4=Media', Locked = true;
            begin
                if not SalesHeader.Get("Document Type", "Document No.") then
                    SalesHeader.Init;
                if DMFMedia.Get("Media Code") then
                    if DMFMedia."Publish Date" < SalesHeader."Order Date" then
                        Message(MsgTxtLbl, SalesHeader."Order Date", DMFMedia.FieldCaption("Publish Date"), DMFMedia."Publish Date", "Media Code");
            end;
        }
        field(50101; "Publish Date"; Date)
        {
            Caption = 'Udgivelsesdato';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("DMF Media Publishing Date"."Publish Date" where("Media Code" = field("Media Code")));

        }
        field(50102; "Dispatch Date"; Date)
        {
            Caption = 'Forsendelsesdato';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("DMF Media Publishing Date"."Dispatch Date" where("Media Code" = field("Media Code")));

        }
        field(50103; "Bill-To Name"; Text[100])
        {
            Caption = 'Faktureres til-navn';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Bill-to Customer No.")));
        }
        field(50104; "Sell-To Name"; Text[100])
        {
            Caption = 'Kundenavn';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Sell-to Customer No.")));
        }
    }
}
