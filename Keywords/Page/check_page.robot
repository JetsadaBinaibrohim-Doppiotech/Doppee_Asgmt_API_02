***Keywords***
Verify Check Order Page Load
    [Arguments]    ${login_Token}    ${user_ID}  ${orders_list}

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

    RETURN    ${product_child}
