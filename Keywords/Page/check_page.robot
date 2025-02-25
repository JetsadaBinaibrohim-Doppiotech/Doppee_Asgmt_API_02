*** Keywords ***
Verify Order ID Was Create Exist In System
    [Arguments]    ${login_Token}    ${user_ID}     ${orders_list}

    Create Session    CheckOrderID    ${URL_Doppee}

    ${URL_Search}=       Set Variable                /api/order/status?user_id=${user_ID}
    ${token_headers}=    Create Dictionary           token=${login_Token}
    ${get_resp}=         GET On Session              
    ...                  CheckOrderID
    ...                  ${URL_Search}
    ...                  headers=${token_headers}
    ...                  expected_status=200

    ${product_parent}=    Set Variable           ${get_resp.json()['orders']}
    ${count_orders}=      Get Length             ${product_parent}
    ${product_child}=     Get From List          ${product_parent}               0
#    ${check_ORDERID}=     Get From Dictionary    ${product_child}                order_id
    ${orders_list}=     Create List
    FOR     ${i}        IN      ${orders_list}
    ${check_ORDERID}=     Get From Dictionary    ${product_child}                order_id
    END
    ${check_STATUS}=      Get From Dictionary    ${product_child}                payment_status    

    Should Be True     ${check_ORDERID}
    Should Be Equal    ${check_STATUS}     PAID

    Log To Console    Check Order Valid ✅
    Log to console    Order Status : ${check_STATUS}

    RETURN    ${check_ORDERID}