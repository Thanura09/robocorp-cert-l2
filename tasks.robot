*** Settings ***
Documentation    Orders robot from RobotSpareBin Industries Inc.
...    Saves the order HTML reciept as PDF
...    Saves the Scrennshot of the ordered robot
...    Embeds the SS of the robot to the PDF reciept
...    Creates ZIP archive of the reciepts and the images

Library    RPA.Browser.Selenium    auto_close=${False}
Library    RPA.HTTP
Library    RPA.Tables



*** Tasks ***
Order Robots from RoboSpareBin Inc.
    Open the order robot page
    Download orders excel file
    Place orders
    # Create order for each row save PDF and SS and combine 


*** Keywords ***

Open the order robot page
    Open Chrome Browser    https://robotsparebinindustries.com/#/robot-order
    Click Element If Visible    //button[@class="btn btn-dark"]
    


Download orders excel file
    Download    https://robotsparebinindustries.com/orders.csv    overwrite=True


Get orders
    ${orders}=    Read table from CSV    orders.csv
    [Return]    ${orders}
    
    

Place orders
    ${orderList}=    Get orders
    Log    ${orderList}
    Fill Form    @{orderList}
    
    

Fill Form
    [Arguments]    @{orderList}
    Click Element If Visible    //button[@class="btn btn-dark"]
    FOR    ${order}    IN    @{orderList}
        # Log    type(int(${order}[Head]))
        # Log    ${order}[Legs]
        Select From List By Value    head    ${order}[Head]    
        Select Radio Button    body    ${order}[Body]    
        Input Text    class:form-control    ${order}[Legs]
        Input Text    address    ${order}[Address]
        Preview Robot
        Submit the order
        ${pdf}=    Store the recipt as a PDF file    ${order}[Order number]
        ${screenshot}=    Take a screenshot of the robot    ${order}[Order number]

    END

Preview Robot
    Click Button    preview

Submit the order
    Click Button    order

Store the recipt as a PDF file    ${orderNum}
[Arguments]    ${orderNumber}

    
Take a screenshot of the robot    ${orderNum}

Embed the screenshot to the PDF recipt


 
    

