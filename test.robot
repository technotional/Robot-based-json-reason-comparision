*** Settings ***
Library  OperatingSystem
Library  RequestsLibrary
Library    Collections

*** Test Cases ***
Compare Json
# Get Json response
    # Create Session  mysession  https://www.metaweather.com    {}    {}    ${None}    ${None}    ${None}    ${False}    0    3    0.1    0    []    []
    # ${response}=  GET On Session  mysession  /api/location/search/  params=query=london
    # Log    Status Should Be  200  ${response} 

    ${json1} =    Get File  C:/D Drive/Projects/Robot with Python/test.json
    ${json2} =    Get File   C:/D Drive/Projects/Robot with Python/test2.json

# Get Json mapper


# Conver Json to Dictionary
    ${json1_dict} =    Evaluate    json.loads('''${json1}''')    json
    ${json2_dict} =    Evaluate    json.loads('''${json2}''')    json

# Iterate Json-1   
    FOR  ${key}  IN  @{json1_dict.keys()}
        ${value1}=   Get From Dictionary    ${json1_dict}    ${key}
    #For every Key1 of Json-1, get Key2 of Json-2 from Mapper object
        Log   Key: ${key}

    #Fetch value2 of Json-2 from Key
   

    #Compare value1 and value2 and do the required action   
        ${value2}=   Get From Dictionary    ${json2_dict}    ${key}
        Run Keyword If    '${value1}' != '${value2}'
        ...    Log  Key '${key}' has different values
    END
