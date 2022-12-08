tableextension 50101 "DMF Sales Inv.Line Ext" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "Media Code"; Code[20])
        {
            Caption = 'Media Code';
            DataClassification = ToBeClassified;
        }
        field(50101; "Publish Date"; Date)
        {
            Caption = 'Publish Date';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("DMF Media Publishing Date"."Publish Date" where("Media Code" = field("Media Code")));

        }
        field(50102; "Dispatch Date"; Date)
        {
            Caption = 'Dispatch Date';
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
