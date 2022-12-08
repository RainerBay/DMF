permissionset 50100 "DMF Permissions Set"
{
    Assignable = true;
    Caption = 'DMF Permissions Set', MaxLength = 30;
    Permissions =
        table "DMF Media Publishing Date" = X,
        tabledata "DMF Media Publishing Date" = RMID,
        page "DMF Media Dates" = X,
        table "DMF Data Import" = X,
        tabledata "DMF Data Import" = RMID;
}
