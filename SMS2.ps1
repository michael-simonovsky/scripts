#virsion 1.0
#script for sending sms with name and status of server 
#created buy paz & michael
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#

###########################################################################get parmters from commend line#####################################################################################################
param(
[string]$test_name,
[string]$status,
[string]$endstatus,
)
#$status="test"
#$test_name="test"
Set-ExecutionPolicy unrestricted -force

$test_name=$test_name.TrimStart("Ping:")
###############################################################################importing the phone nubers from csv file#############################################################
$csvfile=Import-Csv C:\book.csv
$i=0
foreach($calum in $csvfile)
{

    $phone=$csvfile[$i].phone
    $phone="0"+$phone
    
    


###############################################################################creatin the xml file for sending the sms######################################################################################

# Set the File Name
$filePath = ""
 
# Create The Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($filePath,$null)
 
# Set The Formatting
$xmlWriter.Formatting = "Indented"
$xmlWriter.Indentation = "4"
 
# Write the XML Decleration
$xmlWriter.WriteStartDocument()



# Write Root Element
$xmlWriter.WriteStartElement("SMS")
 
# Write the Document

$xmlWriter.WriteElementString("version","Test - 2.5.7")
$xmlWriter.WriteElementString("service","Yoman1"+$i)
$xmlWriter.WriteElementString("MessageID","89027")
$xmlWriter.WriteElementString("PhoneNumber",$phone)
$xmlWriter.WriteElementString("Signature","01237")
$xmlWriter.WriteElementString("MessageCount","1")
$xmlWriter.WriteElementString("TransactionID","c2b50b65-9323-4247-ab7c-9a5b2ae203f1")
$xmlWriter.WriteElementString("Result","Success 2017.07.30 15:15:44")
$xmlWriter.WriteElementString("Text",$test_name+" "+$status+" "+$endstatus)
 
# Write Close Tag for Root Element
$xmlWriter.WriteEndElement # <-- Closing RootElement
 
# End the XML Document
$xmlWriter.WriteEndDocument()
 
# Finish The Document
$xmlWriter.Finalize
$xmlWriter.Flush
$xmlWriter.Close()
####################################################################################################################      
start-sleep -s 2

$i++

}      



