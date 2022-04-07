codeunit 50101 "Country/Region-Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(ReasonLbl) then exit;

        PerformUpgrade();

        UpgradeTag.SetUpgradeTag(ReasonLbl);
    end;

    local procedure PerformUpgrade()
    var
        CountryRegionSetup: Record "Country Setup";
        CountryRegionInstall: Codeunit "Country/Region-Install";

    begin

        if CountryRegionSetup.FindFirst() then
            CountryRegionInstall.HandleFreshInstall()
        else begin
            case CountryRegionSetup."Country/Region Code" of
                'SI':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::SI;
                'RS':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::RS;
                'EL':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::EL;
                else
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::EL;

            end;
            CountryRegionSetup.Modify();
        end;

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(ReasonLbl);
    end;


    var
        ReasonLbl: Label 'BeTerna-SetupEnum-20220406', Locked = true;
    //moja nova izmena
    //moja druga izmena
    //moja treca izmena
}