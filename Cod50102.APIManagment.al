codeunit 50102 AZTranslator_APIManagment
{

    trigger OnRun()
    begin

    end;

    procedure TranslateAZLanguage(TextTranslate: Text; LanguageCode: Text): Text
    var
        AZlanguageCode: Record "Az Language Code";
        jsontable: Record "JSON Buffer";
        JObject: JsonObject;
        JObject2: JsonObject;
        JObject3: JsonObject;
        JToken: JsonToken;
        JToken2: JsonToken;
        JValue: JsonValue;
        keyname: Text;
        Body: Text;
        JArray: JsonArray;
        i: Integer;
        DetectedLanguage: Text;
        JArray2: JsonArray;
        z: Integer;
        Translation: Text;

    begin
        Body := StrSubstNo('[{"Text": "%1"}]', TextTranslate);
        JArray.ReadFrom(POST_Request(SetupAzTranslator."URI Language Translator" + StrSubstNo('&to=%1', LanguageCode), Body));
        for i := 0 to Jarray.Count() - 1 do begin
            Jarray.Get(i, Jtoken);
            JObject := Jtoken.AsObject();
            JObject.get('detectedLanguage', JToken);
            JObject2 := JToken.AsObject();
            JObject2.Get('language', JToken);
            JValue := JToken.AsValue();
            DetectedLanguage := JValue.AsText();

            JObject.get('translations', JToken);
            Jarray2.ReadFrom(Format(Jtoken));
            for z := 0 to JArray2.Count() - 1 do begin
                Jarray2.Get(z, Jtoken);
                JObject := Jtoken.AsObject();
                JObject.get('text', JToken);
                JValue := JToken.AsValue();
                Translation := JValue.AsText();
            end;
            exit(Translation);
        end;





    end;

    procedure SyncronizeAZLanguage()
    var
        AZlanguageCode: Record "Az Language Code";
        jsontable: Record "JSON Buffer";
        JObject: JsonObject;
        JObject2: JsonObject;
        JObject3: JsonObject;
        JToken: JsonToken;
        JToken2: JsonToken;
        JValue: JsonValue;
        keyname: Text;
        nodow: Text;

    begin
        JObject.ReadFrom(GET_Request(SetupAzTranslator."URI Language Syncronize"));
        AZlanguageCode.DeleteAll();
        JObject.Get('translation', JToken);
        JObject2 := JToken.AsObject();
        foreach keyname in JObject2.Keys DO begin
            Clear(JToken);
            JObject2.get(keyname, JToken);
            JObject3 := JToken.AsObject();
            Clear(JToken);
            JObject3.get('name', JToken);
            JValue := JToken.AsValue();

            AZlanguageCode.Init();
            AZlanguageCode."AZ Languge COde" := keyname;
            AZlanguageCode."AZ Description Language" := JValue.AsText();
            AZlanguageCode.Insert();
        end;

    end;

    procedure GET_Request(uri: Text) responseText: Text
    begin

        json := StrSubstNo(uri);

        if client.Get(json, Response) then begin

            Response.Content.ReadAs(json);

            exit(json);

        end;

    end;

    procedure POST_Request(uri: Text; _queryObj: Text) responseText: Text;

    var

        client: HttpClient;

        request: HttpRequestMessage;

        response: HttpResponseMessage;

        contentHeaders: HttpHeaders;

        content: HttpContent;

    begin

        // Add the payload to the content

        content.WriteFrom(_queryObj);

        // Retrieve the contentHeaders associated with the content

        content.GetHeaders(contentHeaders);

        contentHeaders.Clear();

        contentHeaders.Add('Content-Type', 'application/json');
        contentHeaders.Add('Ocp-Apim-Subscription-Key', SetupAzTranslator."API Key");
        contentHeaders.Add('Ocp-Apim-Subscription-Region', SetupAzTranslator.Region);

        // Assigning content to request.Content will actually create a copy of the content and assign it.

        // After this line, modifying the content variable or its associated headers will not reflect in

        // the content associated with the request message

        request.Content := content;

        request.SetRequestUri(uri);

        request.Method := 'POST';

        client.Send(request, response);

        // Read the response content as json.

        response.Content().ReadAs(responseText);

    end;

    procedure SetSetupAZTranslator()
    begin
        SetupAzTranslator.get;
    end;



    var

        Client: HttpClient;

        Response: HttpResponseMessage;

        json: Text;

        _httpContent: HttpContent;

        jsonObj: JsonObject;

        SetupAzTranslator: Record "AZ Translator Setup";


}
