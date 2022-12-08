pageextension 50103 "DMF SalesLines Extension" extends "Sales Lines"
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
        addafter("Sell-to Customer No.")
        {
            field("Sell-To Name"; Rec."Sell-To Name")
            {
                ApplicationArea = All;
                Caption = 'Kundenavn';
                Editable = false;
            }
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                ApplicationArea = All;
                Caption = 'Faktureres til';
                Editable = false;
            }
            field("Bill-To Name"; Rec."Bill-To Name")
            {
                ApplicationArea = All;
                Caption = 'Faktureres til-Navn';
                Editable = false;
            }
        }

    }
}
