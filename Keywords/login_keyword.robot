***Keywords***
Verify Login API Can POST On Data And Get Token
    [Arguments]    ${login_username}    ${login_password}

    Create Session    LoginToken    ${URL_Doppee}

    ${request_body}=    Create Dictionary             
    ...                 username=${login_username}
    ...                 password=${login_password}

    ${URL_Token}=    Set Variable             /api/login/
    ${post_resp}=    POST On Session          
    ...              LoginToken               
    ...              ${URL_Token}             
    ...              json=${request_body} 
    ...              expected_status=200      

    ${user_ID}=        Set Variable                     ${post_resp.json()['id']} 
    ${user_STATUS}=    Set Variable                     ${post_resp.json()['status']}
    ${user_TOKEN}=     Set Variable                     ${post_resp.json()['token']}
    ${user_TYPE}=      Set Variable                     ${post_resp.json()['type']}
    Should Be Equal    ${post_resp.json()['id']}        ${user_ID}
    Should Be Equal    ${post_resp.json()['status']}    success
    Should Be Equal    ${post_resp.json()['token']}     ${user_TOKEN}
    Should Be Equal    ${post_resp.json()['type']}      login
    Log To Console     Login Page Valid ✅
    Log To Console     User ID : ${user_ID}
    Log To Console     User Status : ${user_STATUS}
    Log To Console     User Token : ${user_TOKEN}
    Log To Console     User Type : ${user_TYPE}

    RETURN    ${user_TOKEN}    ${user_ID}