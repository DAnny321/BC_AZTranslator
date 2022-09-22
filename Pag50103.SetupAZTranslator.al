page 50103 "Setup AZ Translator"
{
    PageType = List;
    Caption = 'Setup AZ Translator';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AZ Translator Setup";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("URI Language Syncronize"; rec."URI Language Syncronize")
                {
                    ApplicationArea = All;
                    Caption = 'URI Language';
                }
                field("URI Language Translator"; rec."URI Language Translator")
                {
                    ApplicationArea = All;
                    Caption = 'URI Translator';
                }
                field("API Key"; rec."API Key")
                {
                    ApplicationArea = All;
                    Caption = 'API Key';
                }
                field(Region; Region)
                {
                    ApplicationArea = All;
                    Caption = 'Region';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Syncronize)
            {
                Caption = 'Language Syncronize';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    APIManagment.SetSetupAZTranslator();
                    APIManagment.SyncronizeAZLanguage();
                end;
            }
        }
    }

    var
        APIManagment: Codeunit AZTranslator_APIManagment;
        texttranslate: Text;
}
