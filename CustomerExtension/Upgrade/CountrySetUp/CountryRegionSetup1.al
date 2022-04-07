page 50100 "Country/Region Setup"
{
    Caption = 'Country/Region Setup';
    PageType = Card;
    SourceTable = "Country Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(CountryRegion; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select Country Region';
                    Visible = false;
                }
                field(Name; Rec."Country/Region Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'a';
                    Visible = false;
                }
                field(CountryRegionEnum; Rec."Country/Region Enum")
                {
                    Visible = true;
                    ApplicationArea = All;
                    ToolTip = 'b';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.FindFirst() then begin
            Rec.Init();
            Rec.Insert();
        end;
        // promjena na feature 2
        // dsfadsfafs
        /// 
        /// promjena u masteru
    end;
}
