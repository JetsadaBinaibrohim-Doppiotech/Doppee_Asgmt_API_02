***Keywords***
Verify Search API Can Find Product By Searching Name
    ${user_TOKEN}          ${user_ID}=                                                       
    ...                    commom_keyword.Verify Login API Can POST On Data And Get Token
    ...                    Wulin_taindi@gmail.com
    ...                    Wulin12*
    ${total_PRICEminus}    ${product_ID}=                                                    
    ...                    search_page.Verify Search API Can GET On Data Exist
    ...                    ${user_TOKEN} 
    ...                    Doppee phone
    
    RETURN                 ${user_TOKEN}
    ...                    ${user_ID}                                                        
    ...                    ${total_PRICEminus}                                               
    ...                    ${product_ID}
