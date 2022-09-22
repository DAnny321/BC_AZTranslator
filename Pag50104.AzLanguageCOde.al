page 50104 "Az Language COde"
{

    PageType = List;
    Caption = 'Setup AZ Language';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Az Language Code";
    Editable = false;


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("AZ Languge COde"; rec."AZ Languge COde")
                {
                    ApplicationArea = All;
                    Caption = 'Language COde';
                }
                field("AZ Description Language"; rec."AZ Description Language")
                {
                    ApplicationArea = All;
                    Caption = 'Description Language';
                }


            }
        }
    }


    var
        APIManagment: Codeunit AZTranslator_APIManagment;


}
