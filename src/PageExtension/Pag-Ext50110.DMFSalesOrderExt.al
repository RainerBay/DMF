pageextension 50110 DMF_SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter(SalesDocCheckFactbox)
        {
            part(DMFComment; DMF_CommentFactBoxList)
            {
                ApplicationArea = All;
                SubPageLink = "Table Name" = const(Customer), "No." = field("Sell-to Customer No.");
            }
        }
    }
}
