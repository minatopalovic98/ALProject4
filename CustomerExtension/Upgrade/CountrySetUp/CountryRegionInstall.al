codeunit 50102 "Country/Region-Install"
{
    Subtype = Install;

    trigger OnRun()
    var
        myInt: Integer;
    begin

    end;

    trigger OnInstallAppPerCompany();
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()
        else
            HandleReinstall();

        UpgradeTag.SetAllUpgradeTags();
    end;

    /// <summary>
    /// HandleFreshInstall.
    /// </summary>
    procedure HandleFreshInstall();
    var
        CountryRegionSetup: Record "Country Setup";

    begin
        CountryRegionSetup.Init();
        CountryRegionSetup."Country/Region Code" := 'FR';
        if not CountryRegionSetup.Insert() then
            CountryRegionSetup.Modify();

    end;

    local procedure HandleReinstall();
    var
        CountryRegionSetup: Record "Country Setup";

    begin
        CountryRegionSetup.Init();
        CountryRegionSetup."Country/Region Code" := 'EL';
        if not CountryRegionSetup.Insert() then
            CountryRegionSetup.Modify();

    end;

    //neka promena za Sandija
}
