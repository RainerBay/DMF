table 50100 "DMF Media Publishing Date"
{
    Caption = 'DMF Media Publishing Date';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Media Code"; Code[20])
        {
            Caption = 'Mediekode';
            DataClassification = ToBeClassified;
        }
        field(2; "Publish Date"; Date)
        {
            Caption = 'Udgivelsesdato';
            DataClassification = ToBeClassified;
        }
        field(3; "Dispatch Date"; Date)
        {
            Caption = 'Fremsendelsesdato';
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Beskrivelse';
            DataClassification = ToBeClassified;
        }
        field(5; "Description 2"; Text[100])
        {
            Caption = 'Beskrivelse 2';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Media Code")
        {
            Clustered = true;
        }
    }
}
