table 50103 "AZ Translator Setup"
{
    Caption = 'AZ Translator Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "URI Language Syncronize"; Text[250])
        {
            Caption = 'URI Language Syncronize';
            DataClassification = ToBeClassified;
        }
        field(3; "URI Language Translator"; Text[250])
        {
            Caption = 'URI Language Translator';
            DataClassification = ToBeClassified;
        }
        field(4; "API Key"; Text[250])
        {
            Caption = 'API Key';
            DataClassification = ToBeClassified;
        }
        field(5; "Region"; Text[250])
        {
            Caption = 'Region';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
