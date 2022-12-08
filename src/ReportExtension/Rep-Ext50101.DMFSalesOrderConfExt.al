reportextension 50101 "DMF SalesOrderConfExt" extends "Standard Sales - Order Conf."
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
