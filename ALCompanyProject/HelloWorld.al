table 50103 CompanywiseProjectDetail
{
    Caption = 'Company wise Projects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            AutoIncrement = true;
        }

        field(3; CompanyName; Text[150])
        {
            Caption = 'Company Name';
            // FieldClass = FlowField;
            TableRelation = "Company Information".Name;
            //  CalcFormula = lookup("Company Information".Name where("Primary Key" = field(CompanyId)));
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = "Gen. Journal Line"."Account No.";


        }

        field(6; ProjectName; Text[100])
        {
            Caption = 'ProjectName';
            //  FieldClass = FlowField;
            TableRelation = "Dimension Value".Name WHERE("Dimension Code" = filter('VENDOR'));
            // CalcFormula = lookup( "Dimension Value".Name WHERE ("Dimension Code"=filter('VENDOR')));
        }

    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
        // key(Key1; CompanyId, ProjectId) //secondary key
        // {

        // }
    }

}
page 50104 CompanyWiseProjects
{




    AutoSplitKey = true;

    DelayedInsert = true;
    PageType = Worksheet;

    PromotedActionCategories = 'New,Process,Report,Page,Post/Print,Line,Account';
    SaveValues = true;

    UsageCategory = Tasks;

    ApplicationArea = All;


    SourceTable = CompanywiseProjectDetail;

    AdditionalSearchTerms = 'Company, projects, companywiseproject, Company Wise Projects';

    layout
    {
        area(content)
        {
            repeater(General)
            {


                // field(CompanyId; Rec.CompanyId)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Select Company Id';

                // }

                field(CompanyName; Rec.CompanyName)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of company';

                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the account number that the entry on the journal line will be posted to.';


                }


                field(ProjectName; Rec.ProjectName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Please specify project name';
                }
            }
        }
    }

}
