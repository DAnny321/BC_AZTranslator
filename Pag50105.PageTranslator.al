page 50105 PageTranslator
{
    Caption = 'PageTranslator';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {

        area(content)
        {
            field(languageText; languageText)
            {
                ApplicationArea = All;
                Caption = 'Language Code';
                TableRelation = "Az Language Code";
                trigger OnValidate()
                begin
                    APIManagment.SetSetupAZTranslator();
                    TOText := APIManagment.TranslateAZLanguage(FromText, languageText);
                    CurrPage.Update();
                end;

            }
            group(General)
            {
                field(FromText; FromText)
                {
                    ApplicationArea = All;
                    Caption = 'From Text';
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        if languageText = '' then
                            Error('Set Language Code');

                        APIManagment.SetSetupAZTranslator();
                        TOText := APIManagment.TranslateAZLanguage(FromText, languageText);
                        CurrPage.Update();
                    end;


                }
                field(TOText; TOText)
                {
                    ApplicationArea = All;
                    Caption = 'Translation';
                    MultiLine = true;
                }
            }
        }
    }

    var
        APIManagment: Codeunit AZTranslator_APIManagment;
        FromText: Text;
        TOText: Text;
        languageText: text;

}
