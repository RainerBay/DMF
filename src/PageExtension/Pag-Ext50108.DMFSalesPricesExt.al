pageextension 50108 "DMF SalesPricesExt" extends "Sales Prices"
{
    layout
    {
        addafter("Item No.")
        {
            field(ItemDescription; Rec."Item Description")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Sales Code")
        {
            trigger OnAfterValidate()
            begin
                Rec.CalcFields(Rec."Item Description");

            end;
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec."Item Description");

    end;
}
