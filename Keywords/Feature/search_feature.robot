*** Keywords ***
Verify Search Product Data Success
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
    ${product_PRICE}=         Get From Dictionary                    ${product_CHILD}    price

    Log To Console            Search Page Valid ✅
    Log To Console            Product ID : ${product_ID}
    Log To Console            Product Name : ${product_NAME}
    Log To Console            Product Price : ${product_PRICE}

    RETURN    ${product_PRICE}    ${product_ID}
