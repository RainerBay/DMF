tableextension 50103 "DMF SalesPricesExt" extends "Sales Price"
{
    fields
    {
        field(50100; "Item Description"; Text[100])
        {
            Caption = 'Beskrivelse';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
        }
    }
}
