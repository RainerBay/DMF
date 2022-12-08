page 50102 DMF_CommentFactBoxList
{

    Caption = 'DMF Aftaler';
    PageType = ListPart;
    Editable = false;
    SourceTable = "Comment Line";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code for the comment.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the comment was created.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the comment itself.';
                }
            }
        }
    }
}
