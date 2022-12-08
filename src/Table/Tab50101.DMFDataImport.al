table 50101 "DMF Data Import"
{
    Caption = 'DMF Data Import';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Field1; Text[100])
        {
            Caption = 'Field1';
            DataClassification = ToBeClassified;
        }
        field(3; Field2; Text[100])
        {
            Caption = 'Field2';
            DataClassification = ToBeClassified;
        }
        field(4; Field3; Text[100])
        {
            Caption = 'Field3';
            DataClassification = ToBeClassified;
        }
        field(5; Field4; Text[100])
        {
            Caption = 'Field4';
            DataClassification = ToBeClassified;
        }
        field(6; Field5; Text[100])
        {
            Caption = 'Field5';
            DataClassification = ToBeClassified;
        }
        field(7; Field6; Text[100])
        {
            Caption = 'Field6';
            DataClassification = ToBeClassified;
        }
        field(8; Field7; Text[100])
        {
            Caption = 'Field7';
            DataClassification = ToBeClassified;
        }
        field(9; Field8; Text[100])
        {
            Caption = 'Field8';
            DataClassification = ToBeClassified;
        }
        field(10; Field9; Text[100])
        {
            Caption = 'Field9';
            DataClassification = ToBeClassified;
        }
        field(11; LongField10; Text[2000])
        {
            Caption = 'LongField10';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
