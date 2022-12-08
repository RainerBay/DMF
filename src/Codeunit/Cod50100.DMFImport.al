codeunit 50100 DMF_Import
{
    Permissions = TableData "Vendor Ledger Entry" = rimd,
                  Tabledata "Detailed Vendor Ledg. Entry" = rimd;
    trigger OnRun()
    begin
        ImportDataExcel();
    end;

    var
        myInt: Integer;

    procedure GetBoolean(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Boolean
    var
        Boo: boolean;
    begin
        if evaluate(Boo, Buffer."Cell Value as Text") then
            exit(Boo);
    end;

    procedure GetText(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Text
    begin
        If buffer.get(Row, Col) then begin
            if buffer."Cell Value as Text" = 'NULL' then
                exit('')
            else
                exit(buffer."Cell Value as Text");
        end
    end;

    procedure GetDate(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Date
    var
        Da: Date;
    begin
        If buffer.get(Row, Col) then begin
            if evaluate(Da, Buffer."Cell Value as Text") then
                exit(Da);
        end;
    end;

    procedure GetDecimal(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Decimal
    var
        De: Decimal;
    begin
        If buffer.get(Row, Col) then begin
            if evaluate(De, Buffer."Cell Value as Text") then
                exit(round(De, 0.00001));
        end;
    end;

    procedure GetInteger(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Integer
    var
        Int: Integer;
    begin
        If buffer.get(Row, Col) then begin
            if evaluate(Int, Buffer."Cell Value as Text") then
                exit(Int);
        end;
    end;

    // procedure CreateCustomer(InvoiceData: Record "DMF_DataImport")
    // var
    //     Customer: Record Customer;
    //     CustTemplate: Record "Customer Templ.";
    // begin
    //     if not Customer.Get(InvoiceData.Field1) then begin
    //         Customer."No." := InvoiceData.Field1;
    //         Customer.Name := Copystr(InvoiceData.Field2, 1, MaxStrLen(Customer.Name));
    //         Customer.Insert(true);
    //         if CustTemplate.Get('DPA') then begin
    //             Customer."Gen. Bus. Posting Group" := CustTemplate."Gen. Bus. Posting Group";
    //             Customer."VAT Bus. Posting Group" := CustTemplate."VAT Bus. Posting Group";
    //             Customer."Customer Posting Group" := CustTemplate."Customer Posting Group";
    //             Customer."Payment Terms Code" := CustTemplate."Payment Terms Code";
    //             Customer.Modify(true);
    //         end;
    //     end;

    //     if not Customer.Get(InvoiceData.Field1) then begin
    //         Customer."No." := InvoiceData.Field1;
    //         Customer.Name := Copystr(InvoiceData.Field2, 1, MaxStrLen(Customer.Name));
    //         Customer."Bill-to Customer No." := InvoiceData.Field1;
    //         Customer.Insert(true);
    //         if CustTemplate.Get('DPA') then begin
    //             Customer."Gen. Bus. Posting Group" := CustTemplate."Gen. Bus. Posting Group";
    //             Customer."VAT Bus. Posting Group" := CustTemplate."VAT Bus. Posting Group";
    //             Customer."Customer Posting Group" := CustTemplate."Customer Posting Group";
    //             Customer."Payment Terms Code" := CustTemplate."Payment Terms Code";
    //             Customer.Modify(true);
    //         end;
    //     end;

    //     if not Customer.Get(InvoiceData."Manufacturer ID") then begin
    //         Customer."No." := InvoiceData."Manufacturer ID";
    //         Customer.Name := Copystr(InvoiceData.Reference, 1, MaxStrLen(Customer.Name));
    //         Customer.Insert(true);
    //         if CustTemplate.Get('DPA') then begin
    //             Customer."Gen. Bus. Posting Group" := CustTemplate."Gen. Bus. Posting Group";
    //             Customer."VAT Bus. Posting Group" := CustTemplate."VAT Bus. Posting Group";
    //             Customer."Customer Posting Group" := CustTemplate."Customer Posting Group";
    //             Customer."Payment Terms Code" := CustTemplate."Payment Terms Code";
    //             Customer.Modify(true);
    //         end;
    //     end;
    // end;

    // procedure CreateItem(InvoiceData: Record "DPA Import Data")
    // var
    //     Item: Record Item;
    //     ItemTemplate: Record "Item Templ.";
    // begin
    //     if not Item.Get(InvoiceData."Item No.") then begin
    //         Item."No." := InvoiceData."Item No.";
    //         Item.Description := Copystr(InvoiceData.Reference, 1, MaxStrLen(Item.Description));
    //         Item.Insert(true);
    //         if ItemTemplate.Get('VARE') then begin
    //             Item.Type := Item.Type::Service;
    //             Item."VAT Prod. Posting Group" := ItemTemplate."VAT Prod. Posting Group";
    //             Item."Gen. Prod. Posting Group" := ItemTemplate."Gen. Prod. Posting Group";
    //             Item.Validate("Base Unit of Measure", ItemTemplate."Base Unit of Measure");
    //             Item.Modify(true);
    //         end;
    //     end
    //     else begin
    //         if Item.Type <> Item.Type::Service then begin
    //             Item.Type := Item.Type::Service;
    //             item."Inventory Posting Group" := '';
    //             Item.Modify;
    //         end;
    //     end;
    // end;

    procedure ImportDataExcel()
    var
        ImportData: Record "DMF Data Import";
        IntegerField: Integer;
        Window: Dialog;
        Buffer: Record "Excel Buffer" temporary;
        Ins: InStream;
        Filename: Text;
        LastRow: Integer;
        Row: Integer;
        Counter: Integer;
        ItemCounter: Integer;
        NextLineNo: Integer;
        RememEntryNo: Integer;
        xInvoicingCust: Code[20];
        ImportProgressMsg: Label '#1#################################\\Import Data #2###########', Comment = '%1 = Text, %2 = Progress bar';
    begin
        if UploadIntoStream('Import Invoicing Data from Excel', '', '', Filename, Ins) then begin

            Buffer.OpenBookStream(Ins, 'notes');
            buffer.ReadSheet();
            buffer.SetRange("Column No.", 1);
            buffer.FindLast();
            LastRow := Buffer."Row No.";
            Buffer.Reset();

            Window.Open(ImportProgressMsg);
            Counter := 0;
            ItemCounter := 0;

            for Row := 2 to LastRow do begin
                Counter := Counter + 1;
                Window.update(1, Counter);

                ImportData.init;

                if (GetText(Buffer, 1, Row) <> '') then begin
                    ImportData."Entry No." := 0;
                    ImportData."Field1" := GetText(Buffer, 1, Row);
                    ImportData."Field2" := GetText(Buffer, 2, Row);
                    ImportData."Field3" := GetText(Buffer, 3, Row);
                    ImportData."Field4" := GetText(Buffer, 4, Row);
                    ImportData.Field5 := GetText(Buffer, 5, Row);
                    ImportData.LongField10 := GetText(Buffer, 6, Row);
                    //InvoicingData."Posting Date" := GetDate(Buffer, 7, Row);
                    ImportData.Insert(true);

                end;
            end;
        end;

        Window.close;
        message('Data is updated');
    end;

    // procedure ImportInvoicingDataCSV()
    // var
    //     InvoicingData: Record "DPA Import Data";
    //     InvoicingData2: Record "DPA Import Data";
    //     IntegerField: Integer;
    //     Window: Dialog;
    //     Buffer: Record "CSV Buffer" temporary;
    //     Ins: InStream;
    //     Filename: Text;
    //     DocumentAmount: Decimal;
    //     LastRow: Integer;
    //     Row: Integer;
    //     Counter: Integer;
    //     ItemCounter: Integer;
    //     NextLineNo: Integer;
    //     RememEntryNo: Integer;
    //     xInvoicingCust: Code[20];
    //     ImportProgressMsg: Label '#1#################################\\Import Data #2###########', Comment = '%1 = Text, %2 = Progress bar';
    // begin
    //     if UploadIntoStream('Import Invoicing Data from CSV', '', '', Filename, Ins) then begin

    //         Buffer.LoadDataFromStream(Ins, ';');
    //         LastRow := Buffer.GetNumberOfLines();
    //         Buffer.Reset();

    //         Window.Open(ImportProgressMsg);
    //         Counter := 0;


    //         for Row := 2 to LastRow do begin
    //             Counter := Counter + 1;
    //             Window.update(1, Counter);

    //             InvoicingData.init;

    //             if (Buffer.Get(Row, 1)) then begin
    //                 InvoicingData."Entry No." := 0;
    //                 if Buffer.Get(Row, 1) then
    //                     InvoicingData."Customer ID" := Buffer.Value;
    //                 if Buffer.Get(Row, 2) then
    //                     InvoicingData."Payment Administrator ID" := Buffer.Value;
    //                 if Buffer.Get(Row, 3) then
    //                     InvoicingData."Manufacturer ID" := Buffer.Value;
    //                 if Buffer.Get(Row, 4) then
    //                     InvoicingData."Item No." := Buffer.Value;
    //                 if Buffer.Get(Row, 5) then
    //                     if not evaluate(InvoicingData.Quantity, Buffer.Value) then
    //                         InvoicingData.Quantity := 0;
    //                 if Buffer.Get(Row, 6) then
    //                     InvoicingData.Reference := Buffer.Value;
    //                 if Buffer.Get(Row, 7) then
    //                     if not evaluate(InvoicingData."Posting Date", Buffer.Value) then
    //                         InvoicingData."Posting Date" := 0D;
    //                 InvoicingData.Insert(true);
    //                 if (xInvoicingCust <> InvoicingData."Customer ID") then begin
    //                     if InvoicingData2.Get(RememEntryNo) then
    //                         if DocumentAmount < 0 then begin
    //                             InvoicingData2.IsCredit := true;
    //                             InvoicingData2.Modify;
    //                         end;
    //                     RememEntryNo := InvoicingData."Entry No.";
    //                     InvoicingData."New Invoice" := true;
    //                     InvoicingData.CalcFields("Item Unit Price");
    //                     InvoicingData."Document Amount" := (InvoicingData.Quantity * InvoicingData."Item Unit Price");
    //                     InvoicingData.Modify(true);
    //                     xInvoicingCust := InvoicingData."Customer ID";
    //                     DocumentAmount := (InvoicingData.Quantity * InvoicingData."Item Unit Price");
    //                 end
    //                 else begin
    //                     InvoicingData."Relates To" := RememEntryNo;
    //                     InvoicingData.CalcFields("Item Unit Price");
    //                     DocumentAmount += (InvoicingData.Quantity * InvoicingData."Item Unit Price");
    //                     InvoicingData."Document Amount" := DocumentAmount;
    //                     InvoicingData.Modify(true);
    //                 end;
    //             end;
    //         end;
    //         if InvoicingData2.get(RememEntryNo) then
    //             if DocumentAmount < 0 then begin
    //                 InvoicingData2.IsCredit := true;
    //                 InvoicingData2.Modify;
    //             end;
    //     end;

    //     Window.close;
    //     message('Data is updated');
    // end;

}
