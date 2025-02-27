*** Keywords ***
Verify Search Product Data
    [Arguments]    ${search_response}

    ${product_PARENT}=        Set Variable                           ${search_response['product']}
    ${count_PRODUCT}=         Get Length                             ${product_PARENT}
    ${morethanone}=           Evaluate                               ${count_PRODUCT} > 0
    Should Be True            ${morethanone}

    ${product_CHILD}=         Get From List                          ${product_PARENT}   0                
    ${product_CROSSPRICE}=    Get From Dictionary                    ${product_CHILD}    crossOutPrice
    ${product_ID}=            Get From Dictionary                    ${product_CHILD}    id
    ${product_DISCOUNT}=      Get From Dictionary                    ${product_CHILD}    discount
    ${product_NAME}=          Get From Dictionary                    ${product_CHILD}    name
    ${total_PRICEminus}=      Evaluate                               ${product_CROSSPRICE} - ${product_DISCOUNT}

    Log To Console            Search Page Valid ✅
    Log To Console            Product ID : ${product_ID}
    Log To Console            Product Name : ${product_NAME}
    Log To Console            Product Price : ${total_PRICEminus}    # Already sum minus

    RETURN    ${total_PRICEminus}    ${product_ID}
