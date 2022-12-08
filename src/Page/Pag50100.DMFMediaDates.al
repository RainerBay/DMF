page 50100 "DMF Media Dates"
{
    ApplicationArea = All;
    Caption = 'DMF Media Dates';
    PageType = List;
    SourceTable = "DMF Media Publishing Date";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Media Code";Rec."Media Code")
                {
                    ApplicationArea = All;
                }
                field("Publish Date";Rec."Publish Date")
                {
                    ApplicationArea = All;
                }
                field("Dispatch Date";Rec."Dispatch Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
