#!/bin/bash


if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

> outputaudit.txt
#sudo usg audit cis_level2_workstation > outputaudit.txt 2>&1



source ./src/auditsrc.sh
> test_results.csv
test_results_file="test_results.csv" # For combining
#Create header
echo "Step Number,Step Name,Before Remediation Audit Result,Remediation Step Taken,After Remediation Audit Result" >> "$test_results_file"


#Use 2> error.log to find errors if applicable

#<Step Number> 	<Audit, no(0)/yes(1)> 	<Remediate, no(0)/yes(1)>
1.1.1.1 	1 	0
1.1.1.2		1	0
1.1.1.3		1	0
1.1.1.4		1	0
1.1.1.5		1	0
1.1.1.6		1	0
1.1.1.7		1	0
1.1.2		1	0
1.1.3		1	0
1.1.4		1	0
1.1.22		1	0

1.3.1		1	0
1.3.2		1	0
1.5.2		1	0
1.5.3		1	0
1.5.4		1	0
1.8.2		1	0
1.8.3		1	0
1.7.1		1	1
1.7.2		1	1
1.7.4		1	1
1.8.4		1	0
#Clean Data


# Change ",Fail" to ",Fail,Disabled,Fail" at the end of lines ending with ",Fail"
awk -F',' '/,Fail$/ && gsub(/,/, ",") == 2 {gsub(/,Fail$/, ",Fail,Disabled,Fail")} 1' "$test_results_file" > tmpfile && mv tmpfile "$test_results_file"

# Change ",Disabled,NA" to ",Disabled,NA,Disabled" at the end of lines ending with ",Disabled,NA"
awk -F',' 'gsub(/,/, ",") == 3 && /,Disabled,NA$/ {gsub(/,Disabled,NA$/, ",Disabled,NA,Disabled")} 1' "$test_results_file" > tmpfile && mv tmpfile "$test_results_file"

# Change ",Fail,Remediated" to ",Fail,Remediated,Pass" at the end of lines ending with ",Fail,Remediated"
awk -F',' 'gsub(/,/, ",") == 3 && /,Fail,Remediated$/ {gsub(/,Fail,Remediated$/, ",Fail,Remediated,Pass")} 1' "$test_results_file" > tmpfile && mv tmpfile "$test_results_file"

# Change ",Fail,Remediation Fail" to ",Fail,Remediation Fail,Fail" at the end of lines ending with ",Fail,Remediation Fail"
awk -F',' 'gsub(/,/, ",") == 3 && /,Fail,Remediation Fail$/ {gsub(/,Fail,Remediation Fail$/, ",Fail,Remediation Fail,Fail")} 1' "$test_results_file" > tmpfile && mv tmpfile "$test_results_file"

# Change ",Pass,NA" to ",Pass,NA,Pass" at the end of lines ending with ",Pass,NA"
awk -F',' 'gsub(/,/, ",") == 3 && /,Pass,NA$/ {gsub(/,Pass,NA$/, ",Pass,NA,Pass")} 1' "$test_results_file" > tmpfile && mv tmpfile "$test_results_file"

# Change ",NA,NA" to ",NA,NA,NA" at the end of lines ending with ",NA,NA"
awk -F',' 'gsub(/,/, ",") == 3 && /,NA,NA$/ {gsub(/,NA,NA$/, ",NA,NA,NA")} 1' "$test_results_file" > tmpfile && mv tmpfile "$test_results_file"









#Create report with unique name (Hostname, Datetime of report)
auditfilename="audit#$(hostname)#$(date -u +'%Y-%m-%d#%H:%M:%S#GMT.csv')"
touch $auditfilename #Create Report
#Echo Machine name
echo "Machine name:,$(hostname)" >> "$auditfilename"

# Echo Date and Time (DD/MM/YY GMT) to the report
echo "Date and Time Generated:,$(date -u +'%d/%m/%y-%H:%M:%S GMT')" >> "$auditfilename"

# Echo OS Version to the audit file
echo "OS Version:,$(cat /etc/os-release | grep -E '^PRETTY_NAME' | cut -d '"' -f 2)" >> "$auditfilename"

#Echo Kernel Version
echo "Kernel Version:,$(uname -r)" >> "$auditfilename"

# Loop through network interfaces and store their MAC addresses
interfaces=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d')
for iface in $interfaces; do
    mac_address=$(ifconfig "$iface" | awk '/ether/{print $2}')
    echo "MAC Address of $iface,$mac_address" >> "$auditfilename"
done


beforepasscount=0
beforefailcount=0
beforenacount=0
beforedisabledcount=0

afterpasscount=0
afterfailcount=0
afternacount=0
afterdisabledcount=0

# Generate P/F Stats

while IFS=',' read -r _ _ result _ after; do
  case "$result" in
    "Pass")
      ((beforepasscount++))
      ;;
    "Fail")
      ((beforefailcount++))
      ;;
    "NA")
      ((beforenacount++))
      ;;
    "Disabled")
      ((beforedisabledcount++))
      ;;
  esac

  case "$after" in
    "Pass")
      ((afterpasscount++))
      ;;
    "Fail")
      ((afterfailcount++))
      ;;
    "NA")
      ((afternacount++))
      ;;
    "Disabled")
      ((afterdisabledcount++))
      ;;
  esac
done < "$test_results_file"

# Print headers
echo " " >> "$auditfilename"
echo "Before/After Count,Pass,Fail,NA,Disabled" >> "$auditfilename"
echo "Before,$beforepasscount,$beforefailcount,$beforenacount,$beforedisabledcount" >> "$auditfilename"
echo "After,$afterpasscount,$afterfailcount,$afternacount,$afterdisabledcount" >> "$auditfilename"
echo " " >> "$auditfilename"




cat "$auditfilename" "$test_results_file" > "report/$auditfilename"
rm "$auditfilename"






