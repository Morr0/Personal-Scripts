# TODO Early exit if command not found

EC2_INSTANCE_ID="i-0b10017a625ca6a8d"
CURRENT_EC2_STATE=$(aws ec2 describe-instances --instance-id ${EC2_INSTANCE_ID} --output text | grep STATE)

echo -n "Returned EC2 query\n${CURRENT_EC2_STATE}\n"

if [[ "$CURRENT_EC2_STATE" == *"running"* ]];
then
    echo "EC2 Instance is running, will stop it"

    aws ec2 stop-instances --instance-ids "${EC2_INSTANCE_ID}"

    echo "Called to stop EC2 instance"
else
    echo "EC2 Instance is not running, will run it"

    aws ec2 start-instances --instance-ids "${EC2_INSTANCE_ID}"

    echo "Called to run EC2 instance, will be sleeping for 5 seconds to obtain IP address"
    
    sleep 10

    NEW_IP_LINE=$(aws ec2 describe-instances --instance-id i-0b10017a625ca6a8d --output text | grep ASSOCIATION)
    IP_ADDRESS=$(echo "${NEW_IP_LINE}" | tr -s " " | cut -d " " -f4)

    echo $"New IP address: ${IP_ADDRESS}"
fi