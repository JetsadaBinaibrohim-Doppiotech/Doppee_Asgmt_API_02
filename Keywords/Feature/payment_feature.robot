***Keywords***
Verify Payment API Can Create Order Infomation Complete
    ${user_TOKEN}         ${user_ID}                                                             ${total_PRICEminus}        ${product_ID}=
    ...                   search_feature.Verify Search API Can Find Product By Searching Name
    ${payment_ORDERID}    ${total_PRICEmultiply}=
    ...                   payment_page.Verify Payment API Can POST On Data Exist                 
    ...                   ${user_TOKEN}                                                          
    ...                   ${user_ID}
    ...                   ${test_cardnumber}                                                     
    ...                   ${test_cardexp}                                                        
    ...                   ${test_cardcvc}                                                        
    ...                   ${test_cardname}                                                       
    ...                   ${test_cardtype}                                                       
    ...                   ${test_cardbank}                                                       
    ...                   ${test_fname}                                                          
    ...                   ${test_lname}                                                          
    ...                   ${test_address}                                                        
    ...                   ${test_phone}                                                          
    ...                   ${test_email}                                                          
    ...                   ${product_ID}                                                          
    ...                   ${total_PRICEminus}                                                    
    ...                   ${test_pd_qty}                                                         
    ...                   ${test_pd_promo}
    ${check_ORDERID}=     check_page.Verify Order ID Was Create Exist In System                  
    ...                   ${user_TOKEN}                                                          
    ...                   ${user_ID}
    ...                   max([int(${payment_ORDERID})])  
    ${calculateMAX}=      Evaluate                                                               max([int(${payment_ORDERID})])  
    ${formattedMAX}=      Convert To String                                                      ${calculateMAX}            
    Log to console        Order ID Check Create Lasted : ${formattedMAX}