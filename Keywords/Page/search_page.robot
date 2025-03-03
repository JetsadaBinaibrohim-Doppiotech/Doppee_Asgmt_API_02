*** Keywords ***
Verify Can Search Product Name
    [Arguments]    ${login_Token}    ${product_NAME}      

    Create Session    SearchProduct    ${URL_Doppee}
    ${URL_Search}=       Set Variable           /api/product/search?text=${product_NAME}
    ${token_headers}=    Create Dictionary      token=${login_Token}
    ${get_resp}=         GET On Session         
    ...                  SearchProduct
    ...                  ${URL_Search}
    ...                  headers=${token_headers}
    ...                  expected_status=200

    RETURN    ${get_resp.json()}
