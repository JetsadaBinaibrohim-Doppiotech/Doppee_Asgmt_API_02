*** Keywords ***
Verify Create Order ID Success
    [Arguments]    ${login_Token}
    ...            ${user_id}           ${bin}               ${expDate}        ${cvc} 
    ...            ${cardHolderName}    ${payment_type}      ${issuingBank}    ${first_name} 
    ...            ${last_name}         ${shippingAdress}    ${phone}          ${email} 
    ...            ${product_id}        ${original_price}    ${product_qty}    ${promotion_id} 

    Create Session    OrderSubmit   ${URL_Doppee}

    ${request_body}=    Create Dictionary                   
    ...                 user_id=${user_id}
    ...                 bin=${bin}                          
    ...                 expDate=${expDate}                  
    ...                 cvc=${cvc}                          
    ...                 cardHolderName=${cardHolderName}    
    ...                 payment_type=${payment_type}        
    ...                 issuingBank=${issuingBank}          
    ...                 first_name=${first_name}            
    ...                 last_name=${last_name}
    ...                 shippingAdress=${shippingAdress}
    ...                 phone=${phone}
    ...                 email=${email}                      
    ...                 product_id=${product_id}            
    ...                 original_price=${original_price}
    ...                 product_qty=${product_qty}
    ...                 promotion_id=${None}


    ${URL_payment}=      Set Variable         /api/order_submit
    ${token_headers}=    Create Dictionary    token=${login_token}

    ${post_resp}=    POST On Session
    ...              OrderSubmit
    ...              ${URL_payment}
    ...              headers=${token_headers}
    ...              json=${request_body}
    ...              expected_status=200

    ${payment_MESSAGE}=        Set Variable    ${post_resp.json()['message']}
    ${payment_ORDERID}=        Set Variable    ${post_resp.json()['order_id']}
    ${payment_STATUS}=         Set Variable    ${post_resp.json()['status']}
    ${payment_TYPE}=           Set Variable    ${post_resp.json()['type']}
    ${total_PRICEmultiply}=    Evaluate        ${original_price} * ${product_qty}

    Should Be Equal    ${post_resp.json()['message']}     order submit success
    Should Be Equal    ${post_resp.json()['order_id']}    ${payment_ORDERID}
    Should Be Equal    ${post_resp.json()['status']}      success
    Should Be Equal    ${post_resp.json()['type']}        order_submit

    Log To Console    Order ID Created ✅
    Log To Console    Total Product Summary : ${total_PRICEmultiply}
    Log To Console    OrderID Create : ${payment_ORDERID}

    RETURN    ${payment_ORDERID}    ${total_PRICEmultiply}
