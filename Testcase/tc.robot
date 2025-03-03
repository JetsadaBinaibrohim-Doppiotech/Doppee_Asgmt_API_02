***Settings***
Resource    ../import.robot

***Test Cases***
Test Case - TC01
    ${user_TOKEN}    ${user_ID}=               login_keyword.Verify Login API Can POST On Data And Get Token
    ...              ${test_username}
    ...              ${test_password}

    ${search_response}=    search_page.Verify Can Search Product Name
    ...                    ${user_TOKEN}                          
    ...                    ${test_pd_name}

    ${product_PRICE}    ${product_ID}=        search_feature.Verify Search Product Data Success
    ...                    ${search_response}

    ${payment_ORDERID}    ${total_PRICEmultiply}=    payment_page.Verify Create Order ID Success
    ...                     ${user_TOKEN}                            
    ...                     ${user_ID}
    ...                     ${test_cardnumber}                       
    ...                     ${test_cardexp}                          
    ...                     ${test_cardcvc}                          
    ...                     ${test_cardname}                         
    ...                     ${test_cardtype}                         
    ...                     ${test_cardbank}                         
    ...                     ${test_fname}                                  
    ...                     ${test_lname}                                     
    ...                     ${test_address}                            
    ...                     ${test_phone}                               
    ...                     ${test_email}                            
    ...                     ${product_ID}                            
    ...                     ${product_PRICE}                      
    ...                     ${test_pd_qty}                           
    ...                     ${test_pd_promo}

    ${product_child}=    check_page.Check Get Latest Order Information
    ...                  ${user_TOKEN}                                     
    ...                  ${user_ID}
    ...                  max([int(${payment_ORDERID})])                    
    ${calculateMAX}=     Evaluate                                          max([int(${payment_ORDERID})])    
    ${formattedMAX}=     Convert To String                                 ${calculateMAX}                    

    ${check_ORDERID}=    check_feature.Verify Check Order Matching Status
    ...                  ${product_child}

    Log To Console       Order ID Check Create Lasted : ${formattedMAX}    
    Log To Console       Total Price (Product price x Amount qty) : ${total_PRICEmultiply}