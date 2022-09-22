table 50102 "Az Language Code"
{
    Caption = 'Az Language Code';
    DataClassification = ToBeClassified;
    LookupPageId = "Az Language COde";
    DrillDownPageId = "Az Language COde";

    fields
    {
        field(1; "AZ Languge COde"; Text[10])
        {
            Caption = 'AZ Languge COde';
            DataClassification = ToBeClassified;
        }
        field(2; "AZ Description Language"; Text[100])
        {
            Caption = 'AZ Description Language';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "AZ Languge COde")
        {
            Clustered = true;
        }
    }
}
