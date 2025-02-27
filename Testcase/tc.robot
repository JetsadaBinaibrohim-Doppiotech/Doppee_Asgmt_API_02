***Settings***
Resource    ../import.robot

***Test Cases***
Test Case - TC01
    ${user_TOKEN}    ${user_ID}=               login_keyword.Verify Login API Can POST On Data And Get Token
    ...              Wulin_taindi@gmail.com    
    ...              Wulin12* 

    ${search_response}=    search_page.Verify Search Page Load    
    ...                    ${user_TOKEN}                          
    ...                    Doppee phone

    ${total_PRICEminus}    ${product_ID}=        search_feature.Verify Search Product Data    
    ...                    ${search_response}

    ${payment_ORDERID}    ${total_PRICEmultiply}=    payment_page.Verify Payment Page Load    
    ...                     ${user_TOKEN}                            
    ...                     ${user_ID}
    ...                     ${test_cardnumber}                       
    ...                     ${test_cardexp}                          
    ...                     ${test_cardcvc}                          
    ...                     ${test_cardname}                         
    ...                     ${test_cardtype}                         
    ...                     ${test_cardbank}                         
    ...                     Doppio                                   
    ...                     Tech                                     
    ...                     The office                               
    ...                     0123456789                               
    ...                     ${test_email}                            
    ...                     ${product_ID}                            
    ...                     ${total_PRICEminus}                      
    ...                     ${test_pd_qty}                           
    ...                     ${test_pd_promo}

    ${product_child}=    check_page.Verify Check Order Page Load 
    ...                  ${user_TOKEN}                                     
    ...                  ${user_ID}
    ...                  max([int(${payment_ORDERID})])                    
    ${calculateMAX}=     Evaluate                                          max([int(${payment_ORDERID})])    
    ${formattedMAX}=     Convert To String                                 ${calculateMAX}                    

    ${check_ORDERID}=    check_feature.Verify Check Order Matching Status 
    ...                  ${product_child}

    Log To Console       Order ID Check Create Lasted : ${formattedMAX}    
    Log To Console       Price Product Amount Qty : ${total_PRICEmultiply}