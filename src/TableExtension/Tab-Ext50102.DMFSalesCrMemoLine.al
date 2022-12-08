tableextension 50102 "DMF Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50100; "Media Code"; Code[20])
        {
            Caption = 'Media Code';
            TableRelation = "DMF Media Publishing Date";
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
    }
}
