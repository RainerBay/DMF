pageextension 50105 "DMF PostSalesCrMemoSubFormExt" extends "Posted Sales Cr. Memo Subform"
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
