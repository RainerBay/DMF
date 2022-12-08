pageextension 50109 DMF_CustomerCardExt extends "Customer Card"
{
    layout
    {
        addafter(Payments)
        {
            part(CommentLines; "DMF_Comment List")
            {
                Caption = 'Aftaler';
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = true;
                SubPageLink = "Table Name" = const(Customer), "No." = FIELD("No.");
                UpdatePropagation = Both;
            }
        }
    }
}
