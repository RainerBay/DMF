reportextension 50100 "DMF SalesInvoiceExtension" extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Line)
        {
            column(MediaCode; "Media Code")
            {
            }
            column(MediaCodeLbl; 'Mediakode')
            {
            }
            column(PublishDate; "Publish Date")
            {
            }
            column(PublishDateLbl; 'Udgivelsesdato')
            {
            }
            column(DispatchDate; "Dispatch Date")
            {
            }
            column(DispatchDateLbl; 'Udsendelsesdato')
            {
            }
        }
    }

}
