codeunit 50100 MySubscribers
{
    //[EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnCallPublisher', '', true, true)]
    local procedure MessageOnCallPublisher(var Customer: Record Customer)
    begin
        Message('%1', Customer.Name);
    end;



}