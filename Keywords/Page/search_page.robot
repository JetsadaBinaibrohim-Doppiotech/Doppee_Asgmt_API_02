***Keywords***
Verify Search API Can GET On Data Exist
    [Arguments]    ${login_Token}       ${product_NAME}      

    Create Session    SearchProduct    ${URL_Doppee}

    ${URL_Search}=       Set Variable           /api/product/search?text=${product_NAME}
    ${token_headers}=    Create Dictionary      token=${login_Token}
    ${get_resp}=         GET On Session         
    ...                  SearchProduct
    ...                  ${URL_Search}
    ...                  headers=${token_headers}
    ...                  expected_status=200

    ${product_PARENT}=        Set Variable                           ${get_resp.json()['product']}
    ${count_PRODUCT}=         Get Length                             ${product_PARENT}
    ${morethanone}=           Evaluate                               ${count_PRODUCT} >0
    Should Be True            ${morethanone}
    ${product_CHILD}=         Get From List                          ${product_parent}                              0                
    ${product_CROSSPRICE}=    Get From Dictionary                    ${product_CHILD}                               crossOutPrice
    ${product_ID}=            Get From Dictionary                    ${product_CHILD}                               id
    ${product_DISCOUNT}=      Get From Dictionary                    ${product_CHILD}                               discount
    ${product_NAME}=          Get From Dictionary                    ${product_CHILD}                               name
    ${total_PRICEminus}=      Evaluate                               ${product_CROSSPRICE} - ${product_DISCOUNT}
    Log To Console            Search Page Valid ✅
    Log To Console            Product ID : ${product_ID}
    Log To Console            Product Name : ${product_NAME}
    Log To Console            Product Price : ${total_PRICEminus}    #Alreay sum minus

    RETURN    ${total_PRICEminus}    ${product_ID}