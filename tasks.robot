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
    Read Excel File as table and submit for one order
    # Create order for each row save PDF and SS and combine 


*** Keywords ***

Open the order robot page
    Open Chrome Browser    https://robotsparebinindustries.com/#/robot-order
    Click Element If Visible    //button[@class="btn btn-dark"]
    


Download orders excel file
    Download    https://robotsparebinindustries.com/orders.csv    overwrite=True


Get orders
    ${orders}=    Read table from CSV    orders.csv
    FOR    ${order}    IN    @{orders}
        # Log    ${order}[Head]
        # Select From List By Value    //*[@id="head"]/option[int(${order}[Head])]
        Select Radio Button    body    ${order}[Body]    
        # Input Text    1654923526208    ${order}[Legs]
        Input Text    address    ${order}[Address]
        Click Button    preview    
    END
    

Read Excel File as table and submit for one order
    Get orders
    # Select From List By Value    //*[@id="head"]/option[${orders}[Head]]
    # Select Radio Button    body    ${orders}[Body]    
    # Input Text    1654923526208    ${orders}[Legs]
    # Input Text    address    ${orders}[Address]
    # Click Button    preview

Create order for each row save PDF and SS and combine
 
    

