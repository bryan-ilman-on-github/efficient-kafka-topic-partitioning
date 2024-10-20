#!/bin/bash

# function to print usage
usage() {
    echo "Usage: $0 [-n|--number <number>] [-h|--help]"
    echo
    echo "  -n, --number <number>    Specify the experiment number (1-4) to process."
    echo "  -h, --help               Show this help message and exit."
    echo
    echo "If no -n or --number option is provided, all experiment folders (experiment-001 to experiment-004) will be processed."
    exit 0
}

# parse command-line arguments
while getopts ":n:h" opt; do
    case ${opt} in
        n )
            experiment_number=$OPTARG
            ;;
        h )
            usage
            ;;
        \? )
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        : )
            echo "Invalid option: -$OPTARG requires an argument." >&2
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# validate experiment_number
if [[ -n $experiment_number ]]; then
    if ! [[ $experiment_number =~ ^[1-4]$ ]]; then
        echo "Error: Experiment number must be between 1 and 4." >&2
        usage
    fi
    process_all=false
    folder=$(printf "experiment-%03d" $experiment_number)
    container_folder=$(printf "00%01d" $experiment_number)
else
    process_all=true
fi

# create or remove folders based on the experiment number
if [ "$process_all" = true ]; then
    for i in {1..4}; do
        # format the number with leading zeros
        folder=$(printf "experiment-%03d" $i)

        # remove the existing folder if it exists
        if [ -d "./$folder" ]; then
            echo "Removing existing folder: ./$folder"
            rm -rf ./$folder
        fi

        # create the folder
        echo "Creating folder: ./$folder"
        mkdir -p ./$folder
    done
else
    # remove the existing folder if it exists
    if [ -d "./$folder" ]; then
        echo "Removing existing folder: ./$folder"
        rm -rf ./$folder
    fi

    # create the folder
    echo "Creating folder: ./$folder"
    mkdir -p ./$folder
fi

# get the container ID of 'kafka-clients'
container_id=$(docker ps -qf "name=kafka-clients")

if [ -z "$container_id" ]; then
    echo "Error: kafka-clients container is not running or does not exist." >&2
    exit 1
fi

echo "Container ID: $container_id"

# define a temporary directory
temp_dir=$(mktemp -d)

# copy files from the container to the temporary directory for each folder
if [ "$process_all" = true ]; then
    for i in {1..4}; do
        # format the number with leading zeros
        folder=$(printf "experiment-%03d" $i)
        container_folder=$(printf "00%01d" $i)

        echo "Copying files from container to temporary directory"

        # copy all files from the container's directory to the temporary directory
        docker cp "$container_id:/home/ubuntu/kafka-hdd/experiments/$container_folder" "$temp_dir/$container_folder"

        # filter and move only .png and .dat files to the final destination directory
        echo "Moving .png and .dat files to ./$folder"
        mkdir -p "./$folder"
        find "$temp_dir/$container_folder" -type f \( -name "*.png" -o -name "*.dat" \) -exec mv {} "./$folder/" \;

        # clean up the temporary directory for this folder
        rm -rf "$temp_dir/$container_folder"
    done
else
    echo "Copying files for $folder"

    # copy all files from the container's directory to the temporary directory
    docker cp "$container_id:/home/ubuntu/kafka-hdd/experiments/$container_folder" "$temp_dir/$container_folder"

    # filter and move only .png and .dat files to the final destination directory
    echo "Moving .png and .dat files to ./$folder"
    mkdir -p "./$folder"
    find "$temp_dir/$container_folder" -type f \( -name "*.png" -o -name "*.dat" \) -exec mv {} "./$folder/" \;

    # clean up the temporary directory for this folder
    rm -rf "$temp_dir/$container_folder"
fi

# Clean up the temporary directory
rmdir "$temp_dir"

echo "File transfer complete."
