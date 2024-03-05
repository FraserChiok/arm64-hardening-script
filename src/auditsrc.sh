#/bin/bash



1.1.1.1(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.1.1,Ensure mounting of cramfs filesystems is disabled,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Test modprobe command
		modprobe_output=$(modprobe -n -v cramfs | grep -E '(cramfs|install)')
		# Test lsmod command
		lsmod_output=$(lsmod | grep cramfs)


		if [[ "$modprobe_output" == *"install /bin/true"* ]] && [ "$lsmod_output" == "" ]; then
			echo "1.1.1.1,Ensure mounting of cramfs filesystems is disabled,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$modprobe_output" != *"install /bin/true"* ]] && [ -z "$lsmod_output" ]; then
			echo "1.1.1.1,Ensure mounting of freevxfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$modprobe_output" == *"install /bin/true"* ]] && [ -n "$lsmod_output" ]; then
			echo "1.1.1.1,Ensure mounting of freevxfs filesystems is disabled,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.1.1.1,Ensure mounting of freevxfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			rmmod cramfs	
			echo "install cramfs /bin/true" >> /etc/modprobe.d/cramfs.conf
			sed -i '/1\.1\.1\.1/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			echo "install cramfs /bin/true" >> /etc/modprobe.d/cramfs.conf
			sed -i '/1\.1\.1\.1/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			rmmod cramfs	
			sed -i '/1\.1\.1\.1/ s/Fail/Fail,Remediated/g' $output_file
		fi
	fi
}

1.1.1.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.1.2,Ensure mounting of freevxfs filesystems is disabled,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Test modprobe command
		modprobe_output=$(modprobe -n -v freevxfs | grep -E '(freevxfs|install)')
		# Test lsmod command
		lsmod_output=$(lsmod | grep freevxfs)


		if [[ "$modprobe_output" == *"install /bin/true"* ]] && [ "$lsmod_output" == "" ]; then
			echo "1.1.1.2,Ensure mounting of freevxfs filesystems is disabled,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$modprobe_output" != *"install /bin/true"* ]] && [ -z "$lsmod_output" ]; then
			echo "1.1.1.2,Ensure mounting of freevxfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$modprobe_output" == *"install /bin/true"* ]] && [ -n "$lsmod_output" ]; then
			echo "1.1.1.2,Ensure mounting of freevxfs filesystems is disabled,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.1.1.2,Ensure mounting of freevxfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			rmmod freevxfs	
			echo "install freevxfs /bin/true" >> /etc/modprobe.d/freevxfs.conf
			sed -i '/1\.1\.1\.2/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			echo "install freevxfs /bin/true" >> /etc/modprobe.d/freevxfs.conf
			sed -i '/1\.1\.1\.2/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			rmmod freevxfs	
			sed -i '/1\.1\.1\.2/ s/Fail/Fail,Remediated/g' $output_file
		fi
	fi
}

1.1.1.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.1.3,Ensure mounting of jffs2 filesystems is disabled,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Test modprobe command
		modprobe_output=$(modprobe -n -v jffs2 | grep -E '(jffs2|install)')
		# Test lsmod command
		lsmod_output=$(lsmod | grep jffs2)


		if [[ "$modprobe_output" == *"install /bin/true"* ]] && [ "$lsmod_output" == "" ]; then
			echo "1.1.1.3,Ensure mounting of jffs2 filesystems is disabled,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$modprobe_output" != *"install /bin/true"* ]] && [ -z "$lsmod_output" ]; then
			echo "1.1.1.3,Ensure mounting of jffs2 filesystems is disabled,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$modprobe_output" == *"install /bin/true"* ]] && [ -n "$lsmod_output" ]; then
			echo "1.1.1.3,Ensure mounting of jffs2 filesystems is disabled,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.1.1.3,Ensure mounting of jffs2 filesystems is disabled,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			rmmod jffs2	
			echo "install jffs2 /bin/true" >> /etc/modprobe.d/jffs2.conf
			sed -i '/1\.1\.1\.3/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			echo "install jffs2 /bin/true" >> /etc/modprobe.d/jffs2.conf
			sed -i '/1\.1\.1\.3/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			rmmod jffs2	
			sed -i '/1\.1\.1\.3/ s/Fail/Fail,Remediated/g' $output_file
		fi
	fi
}

1.1.1.4(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.1.4,Ensure mounting of hfs filesystems is disabled,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Test modprobe command
		modprobe_output=$(modprobe -n -v hfs | grep -E '(hfs|install)')
		# Test lsmod command
		lsmod_output=$(lsmod | grep hfs)


		if [[ "$modprobe_output" == *"install /bin/true"* ]] && [ "$lsmod_output" == "" ]; then
			echo "1.1.1.4,Ensure mounting of hfs filesystems is disabled,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$modprobe_output" != *"install /bin/true"* ]] && [ -z "$lsmod_output" ]; then
			echo "1.1.1.4,Ensure mounting of hfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$modprobe_output" == *"install /bin/true"* ]] && [ -n "$lsmod_output" ]; then
			echo "1.1.1.4,Ensure mounting of hfs filesystems is disabled,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.1.1.4,Ensure mounting of hfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			rmmod hfs	
			echo "install hfs /bin/true" >> /etc/modprobe.d/hfs.conf
			sed -i '/1\.1\.1\.4/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			echo "install hfs /bin/true" >> /etc/modprobe.d/hfs.conf
			sed -i '/1\.1\.1\.4/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			rmmod hfs	
			sed -i '/1\.1\.1\.4/ s/Fail/Fail,Remediated/g' $output_file
		fi
	fi
}

1.1.1.5(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.1.5,Ensure mounting of hfsplus filesystems is disabled,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Test modprobe command
		modprobe_output=$(modprobe -n -v hfsplus | grep -E '(hfsplus|install)')
		# Test lsmod command
		lsmod_output=$(lsmod | grep hfsplus)


		if [[ "$modprobe_output" == *"install /bin/true"* ]] && [ "$lsmod_output" == "" ]; then
			echo "1.1.1.5,Ensure mounting of hfsplus filesystems is disabled,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$modprobe_output" != *"install /bin/true"* ]] && [ -z "$lsmod_output" ]; then
			echo "1.1.1.5,Ensure mounting of hfsplus filesystems is disabled,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$modprobe_output" == *"install /bin/true"* ]] && [ -n "$lsmod_output" ]; then
			echo "1.1.1.5,Ensure mounting of hfsplus filesystems is disabled,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.1.1.5,Ensure mounting of hfsplus filesystems is disabled,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			rmmod hfsplus	
			echo "install hfsplus /bin/true" >> /etc/modprobe.d/hfsplus.conf
			sed -i '/1\.1\.1\.5/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			echo "install hfsplus /bin/true" >> /etc/modprobe.d/hfsplus.conf
			sed -i '/1\.1\.1\.5/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			rmmod hfsplus	
			sed -i '/1\.1\.1\.5/ s/Fail/Fail,Remediated/g' $output_file
		fi
	fi
}


1.1.1.6(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.1.6,Ensure mounting of udf filesystems is disabled,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Test modprobe command
		modprobe_output=$(modprobe -n -v udf | grep -E '(udf|install)')
		# Test lsmod command
		lsmod_output=$(lsmod | grep udf)


		if [[ "$modprobe_output" == *"install /bin/true"* ]] && [ "$lsmod_output" == "" ]; then
			echo "1.1.1.6,Ensure mounting of udf filesystems is disabled,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$modprobe_output" != *"install /bin/true"* ]] && [ -z "$lsmod_output" ]; then
			echo "1.1.1.6,Ensure mounting of udf filesystems is disabled,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$modprobe_output" == *"install /bin/true"* ]] && [ -n "$lsmod_output" ]; then
			echo "1.1.1.6,Ensure mounting of udf filesystems is disabled,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.1.1.6,Ensure mounting of udf filesystems is disabled,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			rmmod udf	
			echo "install udf /bin/true" >> /etc/modprobe.d/udf.conf
			sed -i '/1\.1\.1\.6/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			echo "install udf /bin/true" >> /etc/modprobe.d/udf.conf
			sed -i '/1\.1\.1\.6/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			rmmod udf	
			sed -i '/1\.1\.1\.6/ s/Fail/Fail,Remediated/g' $output_file
		fi
	fi
}

1.1.1.7(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.1.7,Ensure mounting of squashfs filesystems is disabled,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Test modprobe command
		modprobe_output=$(modprobe -n -v squashfs | grep -E '(squashfs|install)')
		# Test lsmod command
		lsmod_output=$(lsmod | grep squashfs)


		if [[ "$modprobe_output" == *"install /bin/true"* ]] && [ "$lsmod_output" == "" ]; then
			echo "1.1.1.7,Ensure mounting of squashfs filesystems is disabled,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$modprobe_output" != *"install /bin/true"* ]] && [ -z "$lsmod_output" ]; then
			echo "1.1.1.7,Ensure mounting of squashfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$modprobe_output" == *"install /bin/true"* ]] && [ -n "$lsmod_output" ]; then
			echo "1.1.1.7,Ensure mounting of squashfs filesystems is disabled,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.1.1.7,Ensure mounting of squashfs filesystems is disabled,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			rmmod squashfs	
			echo "install squashfs /bin/true" >> /etc/modprobe.d/squashfs.conf
			sed -i '/1\.1\.1\.7/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			echo "install squashfs /bin/true" >> /etc/modprobe.d/squashfs.conf
			sed -i '/1\.1\.1\.7/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			rmmod squashfs	
			sed -i '/1\.1\.1\.7/ s/Fail/Fail,Remediated/g' $output_file
		fi
	fi
}

1.1.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.2,Ensure /tmp is configured,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for /tmp exist
		test1=$(findmnt -n /tmp)
		if [ -n "$test1" ]; then
			echo "1.1.2,Ensure /tmp is configured,Pass,NA" >> "$output_file"
			return
		else
			echo "1.1.2,Ensure /tmp is configured,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.1\.2/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.1.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.3,Ensure nodev option set on /tmp partition,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for /tmp exist
		test1=$(findmnt -n /tmp)
		if [ -z "$test1" ]; then
			echo "1.1.3,Ensure nodev option set on /tmp partition,NA,NA" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if nodev is present in the partition
		test2=$(findmnt -n /tmp | grep -v nodev)
		if [ -z "$test2" ]; then
			echo "1.1.3,Ensure nodev option set on /tmp partition,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.3,Ensure nodev option set on /tmp partition,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /tmp || { echo "Not remediating, because there is no record of /tmp in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/tmp" "nodev" "" ""

				ensure_partition_is_mounted "/tmp"
			}

			perform_remediation
			sed -i '/1\.1\.3/ s/Fail/Fail,Remediated/g' $output_file

			else
			    sed -i '/1\.1\.3/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}

1.1.4(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.4,Ensure nosuid option set on /tmp partition,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for /tmp exist
		test1=$(findmnt -n /tmp)
		if [ -z "$test1" ]; then
			echo "1.1.4,Ensure nosuid option set on /tmp partition,NA,NA" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if the option is present in the partition
		test2=$(findmnt -n /tmp | grep -v nosuid)
		if [ -z "$test2" ]; then
			echo "1.1.4,Ensure nosuid option set on /tmp partition,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.4,Ensure nosuid option set on /tmp partition,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /tmp || { echo "Not remediating, because there is no record of /tmp in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/tmp" "nosuid" "" ""

				ensure_partition_is_mounted "/tmp"
			}

			perform_remediation
			sed -i '/1\.1\.4/ s/Fail/Fail,Remediated/g' $output_file
			else
			    sed -i '/1\.1\.4/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}

1.1.5(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.5,Ensure noexec option set on /tmp partition,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for /tmp exist
		test1=$(findmnt -n /tmp)
		if [ -z "$test1" ]; then
			echo "1.1.5,Ensure noexec option set on /tmp partition,NA,NA" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if noexec is present in the partition
		test2=$(findmnt -n /tmp | grep -v noexec)
		if [ -z "$test2" ]; then
			echo "1.1.5,Ensure noexec option set on /tmp partition,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.5,Ensure noexec option set on /tmp partition,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then

			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /tmp || { echo "Not remediating, because there is no record of /tmp in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/tmp" "noexec" "" ""

				ensure_partition_is_mounted "/tmp"
			}

			perform_remediation
			sed -i '/1\.1\.5/ s/Fail/Fail,Remediated/g' $output_file
			else
			    sed -i '/1\.1\.5/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi
		fi
	fi
}

1.1.6(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.6,Ensure /dev/shm is configured,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n  /dev/shm)
		if [ -n "$test1" ]; then
			echo "1.1.6,Ensure /dev/shm is configured,Pass,NA" >> "$output_file"
			return
		else
			echo "1.1.6,Ensure /dev/shm is configured,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.1\.6/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.1.7(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.7,Ensure nodev option set on /dev/shm partition,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n /dev/shm)
		if [ -z "$test1" ]; then
			echo "1.1.7,Ensure nodev option set on /tmp partition,NA,NA" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if nodev is present in the partition
		test2=$(findmnt -n /dev/shm | grep -v nodev)
		if [ -z "$test2" ]; then
			echo "1.1.7,Ensure nodev option set on /dev/shm partition,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.7,Ensure nodev option set on /dev/shm partition,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then

			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /dev/shm || { echo "Not remediating, because there is no record of /dev/shm in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/dev/shm" "nodev" "tmpfs" "tmpfs"

				ensure_partition_is_mounted "/dev/shm"
			}

			perform_remediation
			sed -i '/1\.1\.7/ s/Fail/Fail,Remediated/g' $output_file
			else
			    sed -i '/1\.1\.7/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi
		fi
	fi
}

1.1.8(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.8,Ensure nosuid option set on /dev/shm partition,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following partition exist
		test1=$(findmnt -n /dev/shm)
		if [ -z "$test1" ]; then
			echo "1.1.8,Ensure nosuid option set on /dev/shm partition,NA,Disabled" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if option is present in the partition
		test2=$(findmnt -n /dev/shm | grep -v nosuid)
		if [ -z "$test2" ]; then
			echo "1.1.8,Ensure nosuid option set on /dev/shm partition,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.8,Ensure nosuid option set on /dev/shm partition,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /dev/shm || { echo "Not remediating, because there is no record of /dev/shm in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/dev/shm" "nosuid" "tmpfs" "tmpfs"

				ensure_partition_is_mounted "/dev/shm"
			}

			perform_remediation
			sed -i '/1\.1\.8/ s/Fail/Fail,Remediated/g' $output_file
			else
			   sed -i '/1\.1\.8/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}

1.1.9(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.9,Ensure noexec option set on /dev/shm partition,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following partition exist
		test1=$(findmnt -n /dev/shm)
		if [ -z "$test1" ]; then
			echo "1.1.9,Ensure noexec option set on /dev/shm partition,NA,Disabled" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if option is present in the partition
		test2=$(findmnt -n /dev/shm | grep -v noexec)
		if [ -z "$test2" ]; then
			echo "1.1.9,Ensure noexec option set on /dev/shm partition,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.9,Ensure noexec option set on /dev/shm partition,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /dev/shm || { echo "Not remediating, because there is no record of /dev/shm in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/dev/shm" "noexec" "tmpfs" "tmpfs"

				ensure_partition_is_mounted "/dev/shm"
			}

			perform_remediation
			sed -i '/1\.1\.9/ s/Fail/Fail,Remediated/g' $output_file
			else
			    sed -i '/1\.1\.9/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}

1.1.10(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.10,Ensure separate partition exists for /var,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n /var)
		if [ -n "$test1" ]; then
			echo "1.1.10,Ensure separate partition exists for /var,Pass,NA" >> "$output_file"
			return
		else
			echo "1.1.10,Ensure separate partition exists for /var,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.1\.10/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.1.11(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.11,Ensure separate partition exists for /var/tmp,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n /var/tmp)
		if [ -n "$test1" ]; then
			echo "1.1.11,Ensure separate partition exists for /var/tmp,Pass,NA" >> "$output_file"
			return
		else
			echo "1.1.11,Ensure separate partition exists for /var/tmp,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.1\.11/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.1.12(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.12,Ensure /var/tmp partition includes the nodev option,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following partition exist
		test1=$(findmnt -n /var/tmp)
		if [ -z "$test1" ]; then
			echo "1.1.12,Ensure /var/tmp partition includes the nodev option,NA,Disabled" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if option is present in the partition
		test2=$(findmnt -n /var/tmp | grep -v nodev)
		if [ -z "$test2" ]; then
			echo "1.1.12,Ensure /var/tmp partition includes the nodev option,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.12,Ensure /var/tmp partition includes the nodev option,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /var/tmp || { echo "Not remediating, because there is no record of /var/tmp in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/var/tmp" "nodev" "" ""

				ensure_partition_is_mounted "/var/tmp"
			}

			perform_remediation
			sed -i '/1\.1\.12/ s/Fail/Fail,Remediated/g' $output_file
			else
			    sed -i '/1\.1\.12/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}

1.1.13(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.13,Ensure /var/tmp partition includes the nosuid option,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following partition exist
		test1=$(findmnt -n /var/tmp)
		if [ -z "$test1" ]; then
			echo "1.1.13,Ensure /var/tmp partition includes the nosuid option,NA,Disabled" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if option is present in the partition
		test2=$(findmnt -n /var/tmp | grep -v nosuid)
		if [ -z "$test2" ]; then
			echo "1.1.13,Ensure /var/tmp partition includes the nosuid option,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.13,Ensure /var/tmp partition includes the nosuid option,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /var/tmp || { echo "Not remediating, because there is no record of /var/tmp in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/var/tmp" "nosuid" "" ""

				ensure_partition_is_mounted "/var/tmp"
			}

			perform_remediation
			sed -i '/1\.1\.13/ s/Fail/Fail,Remediated/g' $output_file
			else
			    sed -i '/1\.1\.13/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}

1.1.13(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.13,Ensure /var/tmp partition includes the noexec option,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following partition exist
		test1=$(findmnt -n /var/tmp)
		if [ -z "$test1" ]; then
			echo "1.1.13,Ensure /var/tmp partition includes the noexec option,NA,Disabled" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if option is present in the partition
		test2=$(findmnt -n /var/tmp | grep -v noexec)
		if [ -z "$test2" ]; then
			echo "1.1.13,Ensure /var/tmp partition includes the noexec option,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.13,Ensure /var/tmp partition includes the noexec option,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /var/tmp || { echo "Not remediating, because there is no record of /var/tmp in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/var/tmp" "noexec" "" ""

				ensure_partition_is_mounted "/var/tmp"
			}

			perform_remediation
			sed -i '/1\.1\.14/ s/Fail/Fail,Remediated/g' $output_file

			else
			    sed -i '/1\.1\.14/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}


1.1.15(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.15,Ensure separate partition exists for /var/log,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n /var/log)
		if [ -n "$test1" ]; then
			echo "1.1.15,Ensure separate partition exists for /var/log,Pass,NA" >> "$output_file"
			return
		else
			echo "1.1.15,Ensure separate partition exists for /var/log,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.1\.15/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.1.16(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.16,Ensure separate partition exists for /var/log/audit,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n /var/log/audit)
		if [ -n "$test1" ]; then
			echo "1.1.16,Ensure separate partition exists for /var/log/audit,Pass,NA" >> "$output_file"
			return
		else
			echo "1.1.16,Ensure separate partition exists for /var/log/audit,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.1\.16/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.1.17(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.17,Ensure separate partition exists for /home,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n /home)
		if [ -n "$test1" ]; then
			echo "1.1.17,Ensure separate partition exists for /home,Pass,NA" >> "$output_file"
			return
		else
			echo "1.1.17,Ensure separate partition exists for /home,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.1\.17/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.1.18(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.18,Ensure /home partition includes the nodev option,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following partition exist
		test1=$(findmnt -n /home)
		if [ -z "$test1" ]; then
			echo "1.1.18,Ensure /home partition includes the nodev option,NA,Disabled" >> "$output_file"
			return #Return if seperate parititon don't event exist
		fi
		
		#Check if option is present in the partition
		test2=$(findmnt -n /home | grep -v nodev)
		if [ -z "$test2" ]; then
			echo "1.1.18,Ensure /home partition includes the nodev option,Pass,NA" >> "$output_file"
			auditresult="p" #Test pass
		else
			echo "1.1.18,Ensure /home partition includes the nodev option,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

			function include_mount_options_functions {
				:
			}

			# $1: type of filesystem
			# $2: new mount point option
			# $3: filesystem of new mount point (used when adding new entry in fstab)
			# $4: mount type of new mount point (used when adding new entry in fstab)
			function ensure_mount_option_for_vfstype {
				local _vfstype="$1" _new_opt="$2" _filesystem=$3 _type=$4 _vfstype_points=()
				readarray -t _vfstype_points < <(grep -E "[[:space:]]${_vfstype}[[:space:]]" /etc/fstab | awk '{print $2}')

				for _vfstype_point in "${_vfstype_points[@]}"
				do
					ensure_mount_option_in_fstab "$_vfstype_point" "$_new_opt" "$_filesystem" "$_type"
				done
			}

			# $1: mount point
			# $2: new mount point option
			# $3: device or virtual string (used when adding new entry in fstab)
			# $4: mount type of mount point (used when adding new entry in fstab)
			function ensure_mount_option_in_fstab {
				local _mount_point="$1" _new_opt="$2" _device=$3 _type=$4
				local _mount_point_match_regexp="" _previous_mount_opts=""
				_mount_point_match_regexp="$(get_mount_point_regexp "$_mount_point")"

				if [ "$(grep -c "$_mount_point_match_regexp" /etc/fstab)" -eq 0 ]; then
					# runtime opts without some automatic kernel/userspace-added defaults
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
								| sed -E "s/(rw|defaults|seclabel|${_new_opt})(,|$)//g;s/,$//")
					[ "$_previous_mount_opts" ] && _previous_mount_opts+=","
					echo "${_device} ${_mount_point} ${_type} defaults,${_previous_mount_opts}${_new_opt} 0 0" >> /etc/fstab
				elif [ "$(grep "$_mount_point_match_regexp" /etc/fstab | grep -c "$_new_opt")" -eq 0 ]; then
					_previous_mount_opts=$(grep "$_mount_point_match_regexp" /etc/fstab | awk '{print $4}')
					sed -i "s|\(${_mount_point_match_regexp}.*${_previous_mount_opts}\)|\1,${_new_opt}|" /etc/fstab
				fi
			}

			# $1: mount point
			function get_mount_point_regexp {
					printf "[[:space:]]%s[[:space:]]" "$1"
			}

			# $1: mount point
			function assert_mount_point_in_fstab {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				grep "$_mount_point_match_regexp" -q /etc/fstab \
					|| { echo "The mount point '$1' is not even in /etc/fstab, so we can't set up mount options" >&2; return 1; }
			}

			# $1: mount point
			function remove_defaults_from_fstab_if_overriden {
				local _mount_point_match_regexp
				_mount_point_match_regexp="$(get_mount_point_regexp "$1")"
				if grep "$_mount_point_match_regexp" /etc/fstab | grep -q "defaults,"
				then
					sed -i "s|\(${_mount_point_match_regexp}.*\)defaults,|\1|" /etc/fstab
				fi
			}

			# $1: mount point
			function ensure_partition_is_mounted {
				local _mount_point="$1"
				mkdir -p "$_mount_point" || return 1
				if mountpoint -q "$_mount_point"; then
					mount -o remount --target "$_mount_point"
				else
					mount --target "$_mount_point"
				fi
			}
			include_mount_options_functions

			function perform_remediation {
				# test "$mount_has_to_exist" != 'no'
				if test "no" != 'no'; then
					assert_mount_point_in_fstab /home || { echo "Not remediating, because there is no record of /home in /etc/fstab" >&2; return 1; }
				fi

				ensure_mount_option_in_fstab "/home" "nodev" "" ""

				ensure_partition_is_mounted "/home"
			}

			perform_remediation
			sed -i '/1\.1\.18/ s/Fail/Fail,Remediated/g' $output_file
			else
			    sed -i '/1\.1\.18/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		fi
	fi
}

1.1.19(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.1.19,Ensure nodev option set on removable media partitions (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.1.20(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.1.20,Ensure nosuid option set on removable media partitions (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.1.21(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.1.21,Ensure noexec option set on removable media partition (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.1.22(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.22,Ensure sticky bit is set on all world-writable directories,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if sticky bit is set, will return result if world writable directories exist without the sticky bit set
		test1=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null)
		if [ -z "$test1" ]; then #If empty pass
			echo "1.1.22,Ensure sticky bit is set on all world-writable directories,Pass,NA" >> "$output_file"
			
		else
			echo "1.1.22,Ensure sticky bit is set on all world-writable directories,Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs -I '{}' chmod a+t '{}'
			sed -i '/1\.1\.22/ s/Fail/Fail,Remediated/g' $output_file 

		fi
	fi

}

1.1.23(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.23,Disable Automounting,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
	
		test1=$(systemctl is-enabled autofs 2> /dev/null) #Check if enabled/disabled
		test2=$(dpkg -l | grep autofs) #Check if installed #Check if installed

		if [ "$test1" == "disabled" ] ; then
			echo "1.1.23,Disable Automounting,Pass,NA" >> "$output_file"
			auditresults="p"
			
		else
			echo "1.1.23,Disable Automounting,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			systemctl --now disable autofs
			sed -i '/1\.1\.23/ s/Fail/Fail,Remediated/g' $output_file 

		fi
	fi

}

1.1.24(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.1.24,Disable USB Storage,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
	
		test1=$(modprobe -n -v usb-storage) #Check if config disabled
		test2=$(rmmod usb-storage 2> /dev/null) #Check if loaded

		if [ "$test1" == "install /bin/true" ] && [ -z "test2" ]; then
			echo "1.1.24,Disable USB Storage,Pass,NA" >> "$output_file"
			auditresults="p"
			
		else
			echo "1.1.24,Disable USB StorageFail" >> "$output_file"
			auditresult="f" #Test fail
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then 
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then #Check if running in a virtual environment
				if [ ! -f "/etc/modprobe.d/usb-storage.conf" ]; then #Create file if does not exist
					touch /etc/modprobe.d/usb-storage.conf
					chmod 644 /etc/modprobe.d/usb-storage.conf
				fi

				if LC_ALL=C grep -q -m 1 "^install usb-storage" /etc/modprobe.d/usb-storage.conf ; then
					touch /etc/modprobe.d/usb-storage.conf  
					#replaces any line in the /etc/modprobe.d/usb-storage.conf file that starts with "install usb-storage" with "install usb-storage /bin/true."
					sed -i 's#^install usb-storage.*#install usb-storage /bin/true#g' /etc/modprobe.d/usb-storage.conf 
				else

					echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/usb-storage.conf ## Input disable config if does not exist
					echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb-storage.conf 
					sed -i '/1\.1\.24/ s/Fail/Fail,Remediated/g' $output_file
				fi
				rmmod usb-storage 2> /dev/null #Unload module if loaded
			else
				sed -i '/1\.1\.24/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi




			

		fi
	fi

}

1.1.25(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.1.25,Ensure data-at-rest encryption is enabled (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.1.26(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.1.26,Ensure data-at-rest employs cryptographic mechanisms to prevent unauthorized modification (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.1.27(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.1.27,Ensure data-at-rest employs cryptographic mechanisms to prevent unauthorized disclosure (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}


1.2.1(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.2.1,Ensure package manager repositories are configured (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.2.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.2.2,Ensure GPG keys are configured (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.2.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.2.3,Ensure apt is configured to prevent installation without verification of a recognized and approved digital signature,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if seperate partition for the following exist
		test1=$(findmnt -n /home)
		if [ -n "$test1" ]; then
			echo "1.2.3,Ensure apt is configured to prevent installation without verification of a recognized and approved digital signature,Pass,NA" >> "$output_file"
			return
		else
			echo "1.2.3,Ensure apt is configured to prevent installation without verification of a recognized and approved digital signature,Fail" >> "$output_file"
			auditresult="f" #Test 1 
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.2\.3/ s/Fail/Fail,NA/g' $output_file #Remediation requires manual review

		fi
	fi

}



1.3.1(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.3.1,Ensure AIDE is installed,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # 2 Test will start as fail
		# Output test command
		aide=$(dpkg -s aide 2>&1 | grep -E '(Status:|not installed)')
		# Output test command
		aidecommon=$(dpkg -s aide-common 2>&1 | grep -E '(Status:|not installed)')


		if [[ "$aide" == "Status: install ok installed" ]] && [[ "$aidecommon" == "Status: install ok installed" ]]; then
			echo "1.3.1,Ensure AIDE is installed,Pass,NA" >> "$output_file"
			auditresult="pp" #Test 1 and 2 pass
		elif [[ "$aide" != "Status: install ok installed" ]] && [[ "$aidecommon" == "Status: install ok installed" ]]; then
			echo "1.3.1,Ensure AIDE is installed,Fail" >> "$output_file"
			auditresult="fp" #Test 1 fail, test 2 pass
		elif [[ "$aide" == "Status: install ok installed" ]] && [[ "$aidecommon" != "Status: install ok installed" ]]; then
			echo "1.3.1,Ensure AIDE is installed,Fail" >> "$output_file"				
			auditresult="pf" #Test 2 pass, test 1 fail
		else
			echo "1.3.1,Ensure AIDE is installed,Fail" >> "$output_file"
			auditresult="ff" #Test 1 and 2 fail
		fi
			
		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult != "pp" ] && [ $remediate == 1 ]; then
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then #Check Presence of docker

			DEBIAN_FRONTEND=noninteractive apt-get install -y "aide"
			DEBIAN_FRONTEND=noninteractive apt-get install -y "aide-common"


			AIDE_CONFIG=/etc/aide/aide.conf
			DEFAULT_DB_PATH=/var/lib/aide/aide.db

			# Fix db path in the config file, if necessary
			if ! grep -q '^database=file:' ${AIDE_CONFIG}; then
			    # replace_or_append gets confused by 'database=file' as a key, so should not be used.
			    #replace_or_append "${AIDE_CONFIG}" '^database=file' "${DEFAULT_DB_PATH}" '' '%s:%s'
			    echo "database=file:${DEFAULT_DB_PATH}" >> ${AIDE_CONFIG}
			fi

			# Fix db out path in the config file, if necessary
			if ! grep -q '^database_out=file:' ${AIDE_CONFIG}; then
			    echo "database_out=file:${DEFAULT_DB_PATH}.new" >> ${AIDE_CONFIG}
			fi

			/usr/sbin/aideinit -y -f #Initialise DB
			sed -i '/1\.3\.1/ s/Fail/Fail,Remediated/g' $output_file

			else
			    sed -i '/1\.3\.1/ s/Fail/Fail,Remediation Fail/g' $output_file
			fi

		elif [ $auditresult != "pp" ]; then  #Covers fail remediation excludes pass
			sed -i '/1\.3\.1/ s/Fail/Fail,Remediation Fail/g' $output_file 
	
		fi
	fi
}

1.3.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.3.2,Ensure filesystem integrity is regularly checked,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # 2 Test will start as fail
		# Output test command
		test1=$(grep -Ers '^([^#]+\s+)?(\/usr\/s?bin\/|^\s*)aide(\.wrapper)?\s(--check|\$AIDEARGS)\b' /etc/cron.* /etc/crontab /var/spool/cron/)
		

		if [ "$test1" != "" ]; then
			echo "1.3.2,Ensure filesystem integrity is regularly checked,Pass,NA" >> "$output_file"
			auditresult="p" #Test 1 and 2 pass
		else
			echo "1.3.2,Ensure filesystem integrity is regularly checked,Fail" >> "$output_file"
			auditresult="f" #Test 1 and 2 fail

		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult != "p" ] && [ $remediate == 1 ]; then
			#Specify check to run at 5:00 AM every day of the month, every month, and on any day of the week.
			(crontab -l -u root; echo "0 5 * * * /usr/bin/aide.wrapper --config /etc/aide/aide.conf --check") | crontab -u root -
			sed -i '/1\.3\.2/ s/Fail/Fail,Remediated/g' $output_file
		elif [ $auditresult != "p" ]; then #Covers fail remediation excludes pass
			sed -i '/1\.3\.2/ s/Fail/Fail,Remediation Fail/g' $output_file 
			
		fi
	fi
}

1.3.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.3.3,Ensure System Administrator are notified of changes to the baseline configuration or anomalies,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # 2 Test will start as fail
		# Output test command, will return if compliance is met
		test1=$(grep -E '^SILENTREPORTS[[:space:]]*=[[:space:]]*no' /etc/default/aide)
		

		if [ -n "$test1" ]; then #returns compliance result, so it will be filled
			echo "1.3.3,Ensure System Administrator are notified of changes to the baseline configuration or anomalies,Pass,NA" >> "$output_file"
			auditresult="p" #Test 1 and 2 pass
			return
		else
			echo "1.3.3,Ensure System Administrator are notified of changes to the baseline configuration or anomalies,Fail" >> "$output_file"
			auditresult="f" #Test 1 and 2 fail
			
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
		#Remove any SILENTREPORTS=yes
		sed -i '/SILENTREPORTS[[:space:]]*=[[:space:]]*yes/d' /etc/default/aide
		echo "SILENTREPORTS=yes" >> "/etc/default/aide"
		sed -i '/1\.3\.3/ s/Fail/Fail,Remediated/g' $output_file 

		fi
	fi
}

1.3.4(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	echo "1.3.4,Ensure aide script to check file integrity is the default (Manual),NA,NA" >> "$output_file" #Remediation is Manual unable to audit or remediate
}

1.4.2m(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.4.2m,Ensure 'Allow Secure Boot for integrity validation' is set to 'Enabled',Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if secureboot is enabled if enabled, will return if enabled
		test1=$(efivar -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot | awk 'NR > 1 {line[NR-1] = $0} END {if (line[NR-1] ~ /1/) for (i = 1; i < NR; i++) print line[i]}')

		if [ -n "$test1" ]; then #If filled pass
			echo "1.4.2m,Ensure 'Allow Secure Boot for integrity validation' is set to 'Enabled',NA" >> "$output_file"
			
		else
			echo "1.4.2m,Ensure 'Allow Secure Boot for integrity validation' is set to 'Enabled',Fail" >> "$output_file"
			auditresult="f" #Test fail
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/1\.4\.2m/ s/Fail/Fail,NA/g' $output_file #Remediation required is manual

		fi
	fi

}

1.4.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.4.3,Ensure permissions on bootloader config are configured,Disabled,NA" >> "$output_file"
	else
		auditresult="ff" # Test will start as fail
	
		test1=$(stat --format=%a /boot/extlinux/extlinux.conf) #Check permission
		test2=$(stat -c "%U:%G" /boot/extlinux/extlinux.conf) #Check owner:owner group
                if [ "$test1" == 400 ] && [ "$test2" == "root:root" ]; then
                        echo "1.4.3,Ensure permissions on bootloader config are configured,Pass,NA" >> "$output_file"
                        auditresults="pp"
			return
		#test1 is map to first char test2 is mapped to 2nd char
                elif [ "$test1" != 400 ] && [ "$test2" == "root:root" ]; then
                        echo "1.4.3,Ensure permissions on bootloader config are configured,Fail" >> "$output_file"
                        auditresult="fp" 
                elif [ "$test1" == 400 ] && [ "$test2" != "root:root" ]; then
                        echo "1.4.3,Ensure permissions on bootloader config are configured,Fail" >> "$output_file"
                        auditresult="fp"
                else
                        echo "1.4.3,Ensure permissions on bootloader config are configured,Fail" >> "$output_file"
                        auditresult="ff"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			chmod 0400 /boot/extlinux/extlinux.conf
			chown root:root /boot/extlinux/extlinux.conf
			sed -i '/1\.4\.3/ s/Fail/Fail,Remediated/g' $output_file 
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			chmod 0400 /boot/extlinux/extlinux.conf
			sed -i '/1\.4\.3/ s/Fail/Fail,Remediated/g' $output_file 
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then		
			chown root:root /boot/extlinux/extlinux.conf
			sed -i '/1\.4\.3/ s/Fail/Fail,Remediated/g' $output_file 
		fi
	fi

}

1.4.4(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.4.4,Ensure authentication required for single user mode,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
	
		test1=$(grep -Eq '^root:\$[0-9]' /etc/shadow || echo "root is locked") #Check if root pw is set, output will be empty if set
                if [ -z "$test1" ]; then #if empty
                        echo "1.4.4,Ensure authentication required for single user mode,Pass,NA" 
                        auditresults="p"
			return
                else
                        echo "1.4.4,Ensure authentication required for single user mode,Fail"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			echo 'root:Gr0up15' | sudo chpasswd 		#Set Root password
			sed -i '/1\.4\.4/ s/Fail/Fail,Remediated/g' $output_file 
		fi
	fi

}

1.5.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.5.2,Ensure address space layout randomization (ASLR) is enabled,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # 2 Test will start as fail
		# Output test command
		test1=$(sysctl kernel.randomize_va_space)
		test2=$(grep -Es "^\s*kernel\.randomize_va_space\s*=\s*([0-1]|[3-9]|[1-9][0-9]+)" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)
		

		if [ "$test1" == "kernel.randomize_va_space = 2" ] && [ "$test2" == "" ]; then
			echo "1.5.2,Ensure address space layout randomization (ASLR) is enabled,Pass,NA" >> "$output_file"
			auditresult="p" #Test 1 and 2 pass
		else
			echo "1.5.2,Ensure address space layout randomization (ASLR) is enabled,Fail" >> "$output_file"
			auditresult="f" #Test 1 and 2 fail

		fi

		##If remediate is activated, proceed and replace "fail" to "remediated". Both test is the result of 2 different causes. Thus remediation will attempt to check and remediate all at once regardless of which test p/f
		if [ $auditresult != "p" ] && [ $remediate == 1 ]; then
			#Comment out entries that is not value=2 override the default setting of kernel.randomize_va_space
			for file in /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /run/sysctl.d/*.conf; do 
				if [ -f "$file" ]; then
			 		grep -Esq "^\s*kernel\.randomize_va_space\s*=\s*([0-1]|[3-9]|[1-9][0-9]+)" "$file" && sed -ri 's/^\s*kernel\.randomize_va_space\s*=\s*([0-1]|[3-9]|[1-9][0-9]+)/# &/gi' "$file"
			 	fi
			done
 			echo "kernel.randomize_va_space=2" >> /etc/sysctl.conf
			sysctl -w kernel.randomize_va_space=2 #set the active kernel parameter
			sed -i '/1\.5\.2/ s/Fail/Fail,Remediated/g' $output_file


		elif [ $auditresult != "p" ]; then #Covers fail remediation excludes pass
			sed -i '/1\.5\.2/ s/Fail/Fail,Remediation Fail/g' $output_file 
	
		fi
	fi
}

1.5.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.5.3,Ensure prelink is not installed,Disabled" >> "$output_file"
	else
		auditresult="f" #  Test will start as fail
		# Output test command
		test1=$(dpkg -s prelink 2>/dev/null | grep -E '(Status:|not installed)')

		

		if [ "$test1" == "" ]; then # If empty means not installed
			echo "1.5.3,Ensure prelink is not installed,Pass,NA" >> "$output_file"
			auditresult="p" #Test 1 and 2 pass
		else
			echo "1.5.3,Ensure prelink is not installed,Fail" >> "$output_file"
			auditresult="f" #Test 1 and 2 fail

		fi

		##If remediate is activated, remediate accordingly
		if [ $auditresult != "p" ] && [ $remediate == 1 ]; then
			#Uninstall
			DEBIAN_FRONTEND=noninteractive apt-get remove -y "prelink"
			sed -i '/1\.5\.3/ s/Fail/Fail,Remediated/g' $output_file


		elif [ $auditresult != "p" ]; then #Covers fail remediation excludes pass
			sed -i '/1\.5\.3/ s/Fail/Fail,Remediation Fail/g' $output_file 
	
		fi
	fi
}

1.5.4(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.5.4,Ensure core dumps are restricted,Disabled" >> "$output_file"
	else
		auditresult="f" #  Test will start as fail
		# Output test command
		test1=$(grep -Es '^(\*|\s).*hard.*core.*(\s+#.*)?$' /etc/security/limits.conf /etc/security/limits.d/* | awk '{ if ($4 == "0") print }')
		test2=$(sysctl fs.suid_dumpable)
		test3=$(grep -E "^\s*fs\.suid_dumpable\s*=\s*0" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf 2>/dev/null)

		
		# Test1: If not empty means entry for "* hard core 0" is found #Test 2: Contains 0 as the variable #Test3 if not empty means entry for fs.suid_dumpable = 0 exist
		if [ "$test1" != "" ] && [ "$test2" == "fs.suid_dumpable = 0" ] && [ "$test3" != "" ]; then 
			echo "1.5.4,Ensure core dumps are restricted,Pass,NA" >> "$output_file"
			auditresult="p" #Test 1 and 2 pass
		else
			echo "1.5.4,Ensure core dumps are restricted,Fail" >> "$output_file"
			auditresult="f" #Test 1 and 2 fail

		fi

		##If remediate is activated, remediate accordingly, sysctl -w fs.suid_dumpable=0 will activate for all as it is dependent on other variables below, updating will be more efficient
		if [ $auditresult != "p" ] && [ $remediate == 1 ]; then

			sysctl -w fs.suid_dumpable=0
			#Disable user coredumps (if applicable)
			if dpkg-query --show --showformat='${db:Status-Status}\n' 'libpam-runtime' 2>/dev/null | grep -q installed; then

				SECURITY_LIMITS_FILE="/etc/security/limits.conf"

				if grep -qE '\*\s+hard\s+core' $SECURITY_LIMITS_FILE; then
					sed -ri 's/(hard\s+core\s+)[[:digit:]]+/\1 0/' $SECURITY_LIMITS_FILE

				else
					echo "*     hard   core    0" >> $SECURITY_LIMITS_FILE

				fi

			else
				sed -i '/1\.5\.4/ s/Fail/Fail,Remediation Fail/g' $output_file 
			fi

				
			#Remediate fs.suid_dumpable (if applicable)
			if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then



				#
				# Set runtime for fs.suid_dumpable
				#
				/sbin/sysctl -q -n -w fs.suid_dumpable="0"

				#
				# If fs.suid_dumpable present in /etc/sysctl.conf, change value to "0"
				#	else, add "fs.suid_dumpable = 0" to /etc/sysctl.conf
				#
				# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
				# Otherwise, regular sed command will do.
				sed_command=('sed' '-i')
				if test -L "/etc/sysctl.conf"; then
					sed_command+=('--follow-symlinks')
				fi

				# If the cce arg is empty, CCE is not assigned.
				if [ -z "" ]; then
					cce="CCE"
				else
					cce=""
				fi

				# Strip any search characters in the key arg so that the key can be replaced without
				# adding any search characters to the config file.
				stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^fs.suid_dumpable")

				# shellcheck disable=SC2059
				printf -v formatted_output "%s = %s" "$stripped_key" "0"

				# If the key exists, change it. Otherwise, add it to the config_file.
				# We search for the key string followed by a word boundary (matched by \>),
				# so if we search for 'setting', 'setting2' won't match.
				if LC_ALL=C grep -q -m 1 -i -e "^fs.suid_dumpable\\>" "/etc/sysctl.conf"; then
					"${sed_command[@]}" "s/^fs.suid_dumpable\\>.*/$formatted_output/gi" "/etc/sysctl.conf"

				else
					# \n is precaution for case where file ends without trailing newline
					printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "/etc/sysctl.conf" >> "/etc/sysctl.conf"
					printf '%s\n' "$formatted_output" >> "/etc/sysctl.conf"

				fi
				sed -i '/1\.5\.4/ s/Fail/Fail,Remediated/g' $output_file

			else
				sed -i '/1\.5\.4/ s/Fail/Fail,Remediation Fail/g' $output_file 
			fi

		elif [ $auditresult != "p" ]; then #Covers fail remediation excludes pass
			sed -i '/1\.5\.4/ s/Fail/Fail,Remediation Fail/g' $output_file 
	
		fi
	fi
}

1.5.5(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.5.5,Ensure maxlogins is 10 or less,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
	
		test1=$(grep -Es '^\*\s+hard\s+maxlogins\s+[0-9]+$' /etc/security/limits.conf /etc/security/limits.d/* | awk '$4 <= 10') #Check if root pw is set, output will be empty if set
                if [ -z "$test1" ]; then #if empty
                        echo "1.5.5,Ensure maxlogins is 10 or less,Pass,NA" 
                        auditresults="p"
			return
                else
                        echo "1.5.5,Ensure maxlogins is 10 or less,Fail"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then

			if dpkg-query --show --showformat='${db:Status-Status}\n' 'libpam-runtime' 2>/dev/null | grep -q installed; then #Check if libpam-runtime installed


				max_concurent_users='10'



				if grep -q '^[^#]*\<maxlogins\>' /etc/security/limits.d/*.conf; then
					sed -i "/^[^#]*\<maxlogins\>/ s/maxlogins.*/maxlogins $max_concurent_users/" /etc/security/limits.d/*.conf
				elif grep -q '^[^#]*\<maxlogins\>' /etc/security/limits.conf; then
					sed -i "/^[^#]*\<maxlogins\>/ s/maxlogins.*/maxlogins $max_concurent_users/" /etc/security/limits.conf
				else
					echo "*	hard	maxlogins	$max_concurent_users" >> /etc/security/limits.conf
				fi

				sed -i '/1\.5\.5/ s/Fail/Fail,Remediated/g' $output_file 

			else
			    sed -i '/1\.5\.5/ s/Fail/Fail,Remediation Fail/g' $output_file 
			fi
			
		fi
	fi

}

1.5.6(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.5.6,Ensure kdump service is not enabled,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
	
		test1=$(systemctl is-active kdump.service) #Check if service is enabled
                if [ "$test1" == "inactive" ]; then #if inactive pass
                        echo "1.5.6,Ensure kdump service is not enabled,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                else
                        echo "1.5.6,Ensure kdump service is not enabled,Fail" >> "$output_file"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			systemctl disable kdump.service
			sed -i '/1\.5\.6/ s/Fail/Fail,Remediated/g' $output_file 
			
		fi
	fi

}


1.6.1.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.6.1.2,Ensure AppArmor is installed enabled and active,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		
		#Check kernel parameters for APPARMOR Config, will not proceed with others check and require manual remediation if fail
		zcat /proc/config.gz > /tmp/kernel_config
		if grep -q '^CONFIG_SECURITY_APPARMOR=y' /tmp/kernel_config && grep -q '^CONFIG_DEFAULT_SECURITY_APPARMOR=y' /tmp/kernel_config && grep -q '^CONFIG_LSM=.*apparmor' /tmp/kernel_config; then
		  	rm /tmp/kernel_config
			return
		else
		  	echo "1.6.1.2,Ensure AppArmor is installed enabled and active,Fail,NA,NA" >> "$output_file"
			rm /tmp/kernel_config
		fi
		




		test2=$(dpkg -l | awk '/^ii/ && $2 == "apparmor" { print }') #Check if service is installed (apparmor)
		test3=$(dpkg -l | awk '/^ii/ && $2 == "apparmor-utils" { print }') #Check if service is installed (apparmor)
		test4=$(systemctl is-active apparmor.service) #Check active
		test5=$(systemctl is-enabled apparmor.service) #Check enabled


                if [ -n "$test2" ] && [ -n "$test3" ] && [ "$test4" == "active" ] && [ "$test5" == "enabled" ]; then #if inactive pass
                        echo "1.6.1.2,Ensure AppArmor is installed enabled and active,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                else
                        echo "1.6.1.2,Ensure AppArmor is installed enabled and active,Fail" >> "$output_file"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ -n "$test2" ]; then
				DEBIAN_FRONTEND=noninteractive apt-get install -y "apparmor"
			fi
			if [ -n "$test3" ]; then
				DEBIAN_FRONTEND=noninteractive apt-get install -y "apparmor-utils"
			fi
			if [ "$test4" == "active" ]; then
				systemctl start apparmor
			fi
			if [ "$test5" == "enabled" ]; then
				systemctl enable apparmor
			fi
			sed -i '/1\.6\.1\.2/ s/Fail/Fail,Remediated/g'	 $output_file  
		fi
	fi

}

1.6.1.5(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.6.1.5,Ensure all AppArmor Profiles are enforcing,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if any count for non-compilance and print if respective non-compliance count more than 0. So if all 0 for non-compliance, it will not print anything
		test1=$(sudo apparmor_status | grep -E "profiles are in complain mode|processes are in complain mode|processes are unconfined but have a profile defined" | awk '$1 != 0')



                if [ -z "$test1" ]; then #if inactive pass
                        echo "1.6.1.5,Ensure all AppArmor Profiles are enforcing,Pass,NA" 
                        auditresults="p"
			return
                else
                        echo "1.6.1.5,Ensure all AppArmor Profiles are enforcing,Fail"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		#remediation process regardess of which non-compliance is the same
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			aa-enforce /etc/apparmor.d/*
			sed -i '/1\.6\.1\.5/ s/Fail/Fail,Remediated/g'	 $output_file 			
		fi
	fi

}

1.7.1(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.7.1,Ensure message of the day is configured properly,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		
		file=/etc/motd
		if [ ! -f "$file" ]; then #Check if file exist
		    	echo "1.7.1,Ensure message of the day is configured properly,Pass,NA" >> "$output_file"
			return 
		fi


		# Check if /etc/os-release is shown, with options that reveals information about os : \m \r \s \v . If present will return
		test1=$(grep -Eis "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/motd)

	
		#Compliance will return nothing
                if [ -z "$test1" ]; then #if empty pass
                        echo "1.7.1,Ensure message of the day is configured properly,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                else
                        echo "1.7.1,Ensure message of the day is configured properly,Fail" >> "$output_file"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			echo "Authorized use only. All activity may be monitored and reported." > /etc/motd
			sed -i '/1\.7\.1/ s/Fail/Fail,Remediated/g' $output_file  
		fi
	fi

}

1.7.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.7.2,Ensure local login warning banner is configured properly,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		
		file=/etc/issue
		if [ ! -f "$file" ]; then #Check if file exist
		    	echo "1.7.2,Ensure local login warning banner is configured properly,Pass,NA" >> "$output_file"
			return 
		fi


		# Check if /etc/os-release is shown, with options that reveals information about os : \m \r \s \v . If present will return
		test1=$(grep -Eis "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue)

	
		#Compliance will return nothing
                if [ -z "$test1" ]; then #if empty pass
                        echo "1.7.2,Ensure local login warning banner is configured properly,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                else
                        echo "1.7.2,Ensure local login warning banner is configured properly,Fail" >> "$output_file"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			echo "Authorized use only. All activity may be monitored and reported." > $file
			sed -i '/1\.7\.2/ s/Fail/Fail,Remediated/g' $output_file  
		fi
	fi

}

1.7.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.7.3,Ensure remote login warning banner is configured properly,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		
		file=/etc/issue.net
		if [ ! -f "$file" ]; then #Check if file exist
		    	echo "1.7.3,Ensure remote login warning banner is configured properly,Pass,NA" >> "$output_file"
			return 
		fi


		# Check if /etc/os-release is shown, with options that reveals information about os : \m \r \s \v . If present will return
		test1=$(grep -Eis "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue.net)

	
		#Compliance will return nothing
                if [ -z "$test1" ]; then #if empty pass
                        echo "1.7.3,Ensure remote login warning banner is configured properly,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                else
                        echo "1.7.3,Ensure remote login warning banner is configured properly,Fail" >> "$output_file"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			echo "Authorized use only. All activity may be monitored and reported." > $file
			sed -i '/1\.7\.3/ s/Fail/Fail,Remediated/g' $output_file  
		fi
	fi

}

1.7.4(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.7.4,Ensure permissions on /etc/motd are configured,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		
		file=/etc/motd
		if [ ! -f "$file" ]; then #Check if file exist
		    	echo "1.7.4,Ensure permissions on /etc/motd are configured,NA,NA" >> "$output_file"
			return 
		fi

		test1=$(stat --format=%a /etc/motd) #Check permission
		test2=$(stat -c "%U:%G" /etc/motd) #Check owner:owner group

	
		#Compliance will return nothing
                if [ "$test1" == 644 ] && [ "$test2" == "root:root" ]; then
                        echo "1.7.4,Ensure permissions on /etc/motd are configured,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
		else
                        echo "1.7.4,Ensure permissions on /etc/motd are configured,Fail">> "$output_file"
                        auditresult="f"
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ "$test1" != 644 ]; then
				chmod 0644 /etc/motd
			fi

			if [ "$test2" != "root:root" ]; then
				chown root:root /etc/motd
			fi

			sed -i '/1\.7\.4/ s/Fail/Fail,Remediated/g' $output_file  
		fi
	fi
}

1.7.5(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.7.5,Ensure permissions on /etc/issue are configured,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		
		file=/etc/issue
		if [ ! -f "$file" ]; then #Check if file exist
		    	echo "1.7.5,Ensure permissions on /etc/issue are configured,NA,NA" >> "$output_file"
			return 
		fi

		test1=$(stat --format=%a /etc/issue) #Check permission
		test2=$(stat -c "%U:%G" /etc/issue) #Check owner:owner group

	
		#Compliance will return nothing
                if [ "$test1" == 644 ] && [ "$test2" == "root:root" ]; then
                        echo "1.7.5,Ensure permissions on /etc/issue are configured,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
		else
                        echo "1.7.5,Ensure permissions on /etc/issue are configured,Fail">> "$output_file"
                        auditresult="f"
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ "$test1" != 644 ]; then
				chmod 0644 /etc/issue
			fi

			if [ "$test2" != "root:root" ]; then
				chown root:root /etc/issue
			fi

			sed -i '/1\.7\.5/ s/Fail/Fail,Remediated/g' $output_file  
		fi
	fi
}

1.7.6(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.7.6,Ensure permissions on /etc/issue.net are configured,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		
		file=/etc/issue.net
		if [ ! -f "$file" ]; then #Check if file exist
		    	echo "1.7.6,Ensure permissions on /etc/issue.net are configured,NA,NA" >> "$output_file"
			return 
		fi

		test1=$(stat --format=%a /etc/issue.net) #Check permission
		test2=$(stat -c "%U:%G" /etc/issue.net) #Check owner:owner group

	
		#Compliance will return nothing
                if [ "$test1" == 644 ] && [ "$test2" == "root:root" ]; then
                        echo "1.7.6,Ensure permissions on /etc/issue.net are configured,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
		else
                        echo "1.7.6,Ensure permissions on /etc/issue.net are configured,Fail">> "$output_file"
                        auditresult="f"
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			if [ "$test1" != 644 ]; then
				chmod 0644 /etc/issue.net
			fi

			if [ "$test2" != "root:root" ]; then
				chown root:root /etc/issue.net
			fi

			sed -i '/1\.7\.6/ s/Fail/Fail,Remediated/g' $output_file  
		fi
	fi
}



1.8.2(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.8.2,Ensure GDM login banner is configured,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if any count for non-compilance and print if respective non-compliance count more than 0. So if all 0 for non-compliance, it will not print anything
		test1(){
			# Grep [org/gnome/login-screen] to before the next section unique identifer of a section is [sectionname]
			tmpfile1=tmpfile1.txt # To store section content temp
			awk '/^\[org\/gnome\/login-screen\]/ {print; in_section=1; next} in_section && /^\[/ {in_section=0; next} in_section {print}' /etc/gdm3/greeter.dconf-defaults > $tmpfile1
			conditionoutput1=$(grep -E '^\s*banner-message-enable\s*=\s*true\b' $tmpfile1) # grep disable-user-list=true, if exist, should return a result"
			rm tmpfile1.txt #Remove accordingly
			if [ -n "$conditionoutput1" ]; then
				echo "p" 
			fi
			
		}

		test2(){
			# Grep [org/gnome/login-screen] to before the next section unique identifer of a section is [sectionname]
			tmpfile1=tmpfile1.txt # To store section content temp
			awk '/^\[org\/gnome\/login-screen\]/ {print; in_section=1; next} in_section && /^\[/ {in_section=0; next} in_section {print}' /etc/gdm3/greeter.dconf-defaults > $tmpfile1
			conditionoutput2=$(grep -E "^\s*banner-message-text\s*='[^']*[^']+'$" "$tmpfile1") #Grep banner-message-text='<banner message>',  <banner message> can be anything
			rm tmpfile1.txt #Remove accordingly
			if [ -n "$conditionoutput2" ]; then
				echo "p" 
			fi
			
		}
		


		test1output=$(test1)
		test2output=$(test2)

		

                if [ -n "$test1output" ] && [ -n "$test2output" ]; then #if both fill means pass, variable that is empty fails test
                        echo "1.8.2,Ensure GDM login banner is configured,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                elif [ -z "$test1output" ] && [ -n "$test2output" ]; then
                        echo "1.8.2,Ensure GDM login banner is configured,Fail" >> "$output_file"
                        auditresult="fp"
                elif [ -n "$test1output" ] && [ -z "$test2output" ]; then
                        echo "1.8.2,Ensure GDM login banner is configured,Fail" >> "$output_file"
                        auditresult="pf"
		else
                        echo "1.8.2,Ensure GDM login banner is configured,Fail" >> "$output_file"
                        auditresult="ff"			
                fi
		echo $auditresult

		#Remediation for banner-message-enable=true
		remediate1(){
			# Will do both approach, since we plan to migrate to checks over dconf db. That way, future updates of the tool
			# will pass the check even if we decide to check only for the dconf db path.
			if [ -e "/etc/gdm3/greeter.dconf-defaults" ] ; then
			    
			    	LC_ALL=C sed -i "/^\s*banner\-message\-enable/Id" "/etc/gdm3/greeter.dconf-defaults"
			else
			    	touch "/etc/gdm3/greeter.dconf-defaults" 
			fi
			cp "/etc/gdm3/greeter.dconf-defaults" "/etc/gdm3/greeter.dconf-defaults.bak" 
			# Insert after the line matching the regex '\[org/gnome/login-screen\]'
			line_number="$(LC_ALL=C grep -n "\[org/gnome/login-screen\]" "/etc/gdm3/greeter.dconf-defaults.bak" | LC_ALL=C sed 's/:.*//g')"
			if [ -z "$line_number" ]; then
			    	# There was no match of '\[org/gnome/login-screen\]', insert at
				# the end of the file.
				printf '%s\n' "banner-message-enable=true" >> "/etc/gdm3/greeter.dconf-defaults"
			else
			    	head -n "$(( line_number ))" "/etc/gdm3/greeter.dconf-defaults.bak" > "/etc/gdm3/greeter.dconf-defaults"
			    	printf '%s\n' "banner-message-enable=true" >> "/etc/gdm3/greeter.dconf-defaults"
			    	tail -n "+$(( line_number + 1 ))" "/etc/gdm3/greeter.dconf-defaults.bak" >> "/etc/gdm3/greeter.dconf-defaults"
			fi
				# Clean up after ourselves.
				rm "/etc/gdm3/greeter.dconf-defaults.bak"
				# Check for setting in any of the DConf db directories
				# If files contain ibus or distro, ignore them.
				# The assignment assumes that individual filenames don't contain :
				readarray -t SETTINGSFILES < <(grep -r "\\[org/gnome/login-screen\\]" "/etc/dconf/db/" | grep -v 'distro\|ibus' | cut -d":" -f1)
				DCONFFILE="/etc/dconf/db/gdm.d/00-security-settings"
				DBDIR="/etc/dconf/db/gdm.d"

			mkdir -p "${DBDIR}"

			if [ "${#SETTINGSFILES[@]}" -eq 0 ]
			then
			    	[ ! -z ${DCONFFILE} ] || echo "" >> ${DCONFFILE}
			    	printf '%s\n' "[org/gnome/login-screen]" >> ${DCONFFILE}
			    	printf '%s=%s\n' "banner-message-enable" "true" >> ${DCONFFILE}
			else
			    	escaped_value="$(sed -e 's/\\/\\\\/g' <<< "true")"
			    	if grep -q "^\\s*banner-message-enable\\s*=" "${SETTINGSFILES[@]}"
			    	then
				
				sed -i "s/\\s*banner-message-enable\\s*=\\s*.*/banner-message-enable=${escaped_value}/g" "${SETTINGSFILES[@]}"
			    else
				sed -i "\\|\\[org/gnome/login-screen\\]|a\\banner-message-enable=${escaped_value}" "${SETTINGSFILES[@]}"
			    fi
			fi

			dconf update #Update accordingly


		}


		#Remediation for banner-message-text='<banner message>'
		remediate2(){


			login_banner_text='Authorized uses only. All activity may be monitored and reported.'



			# Multiple regexes transform the banner regex into a usable banner
			# 0 - Remove anchors around the banner text
			login_banner_text=$(echo "$login_banner_text" | sed 's/^\^\(.*\)\$$/\1/g')
			# 1 - Keep only the first banners if there are multiple
			#    (dod_banners contains the long and short banner)
			login_banner_text=$(echo "$login_banner_text" | sed 's/^(\(.*\)|.*)$/\1/g')
			# 2 - Add spaces ' '. (Transforms regex for "space or newline" into a " ")
			login_banner_text=$(echo "$login_banner_text" | sed 's/\[\\s\\n\]+/ /g')
			# 3 - Adds newline "tokens". (Transforms "(?:\[\\n\]+|(?:\\n)+)" into "(n)*")
			login_banner_text=$(echo "$login_banner_text" | sed 's/(?:\[\\n\]+|(?:\\\\n)+)/(n)*/g')
			# 4 - Remove any leftover backslash. (From any parethesis in the banner, for example).
			login_banner_text=$(echo "$login_banner_text" | sed 's/\\//g')
			# 5 - Removes the newline "token." (Transforms them into newline escape sequences "\n").
			#    ( Needs to be done after 4, otherwise the escapce sequence will become just "n".
			login_banner_text=$(echo "$login_banner_text" | sed 's/(n)\*/\\n/g')

			# Will do both approach, since we plan to migrate to checks over dconf db. That way, future updates of the tool
			# will pass the check even if we decide to check only for the dconf db path.
			if [ -e "/etc/gdm3/greeter.dconf-defaults" ] ; then
			    
			    	LC_ALL=C sed -i "/^\s*banner\-message\-text/Id" "/etc/gdm3/greeter.dconf-defaults"
			else
			    	touch "/etc/gdm3/greeter.dconf-defaults"
			fi
			cp "/etc/gdm3/greeter.dconf-defaults" "/etc/gdm3/greeter.dconf-defaults.bak"
			# Insert after the line matching the regex '\[org/gnome/login-screen\]'
			line_number="$(LC_ALL=C grep -n "\[org/gnome/login-screen\]" "/etc/gdm3/greeter.dconf-defaults.bak" | LC_ALL=C sed 's/:.*//g')"
			if [ -z "$line_number" ]; then
				# There was no match of '\[org/gnome/login-screen\]', insert at
				# the end of the file.
				printf '%s\n' "banner-message-text='${login_banner_text}'" >> "/etc/gdm3/greeter.dconf-defaults"
			else
			    	head -n "$(( line_number ))" "/etc/gdm3/greeter.dconf-defaults.bak" > "/etc/gdm3/greeter.dconf-defaults"
			    	printf '%s\n' "banner-message-text='${login_banner_text}'" >> "/etc/gdm3/greeter.dconf-defaults"
			    	tail -n "+$(( line_number + 1 ))" "/etc/gdm3/greeter.dconf-defaults.bak" >> "/etc/gdm3/greeter.dconf-defaults"
			fi
			# Clean up after ourselves.
			rm "/etc/gdm3/greeter.dconf-defaults.bak"
			# Check for setting in any of the DConf db directories
			# If files contain ibus or distro, ignore them.
			# The assignment assumes that individual filenames don't contain :
			readarray -t SETTINGSFILES < <(grep -r "\\[org/gnome/login-screen\\]" "/etc/dconf/db/" | grep -v 'distro\|ibus' | cut -d":" -f1)
			DCONFFILE="/etc/dconf/db/gdm.d/00-security-settings"
			DBDIR="/etc/dconf/db/gdm.d"

			mkdir -p "${DBDIR}"

			if [ "${#SETTINGSFILES[@]}" -eq 0 ]
			then
			    	[ ! -z ${DCONFFILE} ] || echo "" >> ${DCONFFILE}
			    	printf '%s\n' "[org/gnome/login-screen]" >> ${DCONFFILE}
			    	printf '%s=%s\n' "banner-message-text" "'${login_banner_text}'" >> ${DCONFFILE}
			else
			    	escaped_value="$(sed -e 's/\\/\\\\/g' <<< "'${login_banner_text}'")"
			    	if grep -q "^\\s*banner-message-text\\s*=" "${SETTINGSFILES[@]}"
			    	then
				
					sed -i "s/\\s*banner-message-text\\s*=\\s*.*/banner-message-text=${escaped_value}/g" "${SETTINGSFILES[@]}"
			    	else
					sed -i "\\|\\[org/gnome/login-screen\\]|a\\banner-message-text=${escaped_value}" "${SETTINGSFILES[@]}"
			    	fi
			fi

			dconf update
		}

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		#remediation process regardess of which non-compliance is the same
		if [ $auditresult == "ff" ] && [ $remediate == 1 ]; then
			remediate1
			remediate2
			sed -i '/1\.8\.2/ s/Fail/Fail,Remediated/g' $output_file 
		elif [ $auditresult == "fp" ] && [ $remediate == 1 ]; then
			remediate1
			sed -i '/1\.8\.2/ s/Fail/Fail,Remediated/g' $output_file 
		elif [ $auditresult == "pf" ] && [ $remediate == 1 ]; then
			remediate2
			sed -i '/1\.8\.2/ s/Fail/Fail,Remediated/g' $output_file 
			
		fi
	fi

}

1.8.3(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.8.3,Ensure disable-user-list is enabled,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if any count for non-compilance and print if respective non-compliance count more than 0. So if all 0 for non-compliance, it will not print anything
		test1(){
			# Grep [org/gnome/login-screen] to before the next section unique identifer of a section is [sectionname]
			tmpfile1=tmpfile1.txt # To store section content temp
			awk '/^\[org\/gnome\/login-screen\]/ {print; in_section=1; next} in_section && /^\[/ {in_section=0; next} in_section {print}' /etc/gdm3/greeter.dconf-defaults >$tmpfile1
			conditionoutput=$(grep -E '^\s*disable-user-list\s*=\s*true\b' $tmpfile1) # grep disable-user-list=true, if exist, should return a result"
			rm tmpfile1.txt #Remove accordingly
			if [ -n "$conditionoutput" ]; then
				echo $conditionoutput #return disable-user-list=true if it is found
			fi
			
		}
		test1output=$(test1)

		

                if [ -n "$test1output" ]; then #if disable-user-list=true is found means condition is met
                        echo "1.8.3,Ensure disable-user-list is enabled,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                else
                        echo "1.8.3,Ensure disable-user-list is enabled,Fail" >> "$output_file"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		#remediation process regardess of which non-compliance is the same
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then



			# Will do both approach, since we plan to migrate to checks over dconf db. That way, future updates of the tool
			# will pass the check even if we decide to check only for the dconf db path.
			if [ -e "/etc/gdm3/greeter.dconf-defaults" ] ; then
			    
				LC_ALL=C sed -i "/^\s*disable\-user\-list/Id" "/etc/gdm3/greeter.dconf-defaults"
			else
			    	touch "/etc/gdm3/greeter.dconf-defaults"
			fi

			cp "/etc/gdm3/greeter.dconf-defaults" "/etc/gdm3/greeter.dconf-defaults.bak"
			# Insert after the line matching the regex '\[org/gnome/login-screen\]'
			line_number="$(LC_ALL=C grep -n "\[org/gnome/login-screen\]" "/etc/gdm3/greeter.dconf-defaults.bak" | LC_ALL=C sed 's/:.*//g')"
			if [ -z "$line_number" ]; then
			    	# There was no match of '\[org/gnome/login-screen\]', insert at
			    	# the end of the file.
			    	printf '%s\n' "disable-user-list=true" >> "/etc/gdm3/greeter.dconf-defaults"
			else
			    	head -n "$(( line_number ))" "/etc/gdm3/greeter.dconf-defaults.bak" > "/etc/gdm3/greeter.dconf-defaults"
				printf '%s\n' "disable-user-list=true" >> "/etc/gdm3/greeter.dconf-defaults"
			    	tail -n "+$(( line_number + 1 ))" "/etc/gdm3/greeter.dconf-defaults.bak" >> "/etc/gdm3/greeter.dconf-defaults"
			fi
			# Clean up after ourselves.
			rm "/etc/gdm3/greeter.dconf-defaults.bak"
			# Check for setting in any of the DConf db directories
			# If files contain ibus or distro, ignore them.
			# The assignment assumes that individual filenames don't contain :
			readarray -t SETTINGSFILES < <(grep -r "\\[org/gnome/login-screen\\]" "/etc/dconf/db/" | grep -v 'distro\|ibus' | cut -d":" -f1)
			DCONFFILE="/etc/dconf/db/gdm.d/00-security-settings"
			DBDIR="/etc/dconf/db/gdm.d"

			mkdir -p "${DBDIR}"

			if [ "${#SETTINGSFILES[@]}" -eq 0 ]
			then
			    [ ! -z ${DCONFFILE} ] || echo "" >> ${DCONFFILE}
			    printf '%s\n' "[org/gnome/login-screen]" >> ${DCONFFILE}
			    printf '%s=%s\n' "disable-user-list" "true" >> ${DCONFFILE}
			else
			    escaped_value="$(sed -e 's/\\/\\\\/g' <<< "true")"
			    if grep -q "^\\s*disable-user-list\\s*=" "${SETTINGSFILES[@]}"
			    then
				
				sed -i "s/\\s*disable-user-list\\s*=\\s*.*/disable-user-list=${escaped_value}/g" "${SETTINGSFILES[@]}"
			    else
				sed -i "\\|\\[org/gnome/login-screen\\]|a\\disable-user-list=${escaped_value}" "${SETTINGSFILES[@]}"
			    fi
			fi

			dconf update #Update accordingly
			



			sed -i '/1\.8\.3/ s/Fail/Fail,Remediated/g' $output_file 
			
		fi
	fi

}

1.8.4(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.8.4,Ensure XDCMP is not enabled,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		# Check if any count for non-compilance and print if respective non-compliance count more than 0. So if all 0 for non-compliance, it will not print anything

		test1(){
			# Grep [xdmcp] to before the next section unique identifer of a section is [sectionname]
			tmpfile2=tmpfile2.txt # To store section content temp
			awk '/^\[xdmcp\]/ {print; in_section=1; next} in_section && /^\[/ {in_section=0; next} in_section {print}' /etc/gdm3/custom.conf > $tmpfile2
			conditionoutput=$(grep -E '^\s*Enable\s*=\s*true\b' $tmpfile2) # grep Enable=true, if exist, should return a result"
			rm $tmpfile2 # Remove accordingly
			if [ -n "$conditionoutput" ]; then
				echo "$conditionoutput" # return Enable=true if it is found
			fi
		}

		test1output=$(test1)

		

                if [ -z "$test1output" ]; then #if Enable=true, is found, means compliance is false
                        echo "1.8.4,Ensure XDCMP is not enabled,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
                else
                        echo "1.8.4,Ensure XDCMP is not enabled,Fail" >> "$output_file"
                        auditresult="f"
                fi


		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		#remediation process regardess of which non-compliance is the same


		if [ "$auditresult" == "f" ] && [ "$remediate" == 1 ]; then
			sed -i -e '/^\s*Enable\s*=\s*true\b/d' /etc/gdm3/custom.conf
			sed -i '/1\.8\.4/ s/Fail/Fail,Remediated/g' $output_file  
		fi	
	fi
}


1.10(){ 
	
	#Output result file
	output_file="test_results.csv"
	proceed=$1 #Argument 0/1 to audit
	remediate=$2 #Argument 0/1 to remediate
	if [ $proceed == 0 ]; then
		#Do not audit this step if proceed=0
		echo "1.10,Disable rosmaster listening on all interfaces by default,Disabled,NA" >> "$output_file"
	else
		auditresult="f" # Test will start as fail
		

		#verify if compliance is met by having in ROS_HOSTNAME="localhost" /etc/environment
		test1=$(grep -Eis '^\s*ROS_HOSTNAME\s*=\s*"localhost"' /etc/environment) 

	
		#Compliance will return something (ROS_HOSTNAME="localhost")
                if [ -n "$test1" ]; then
                        echo "1.10,Disable rosmaster listening on all interfaces by default,Pass,NA" >> "$output_file"
                        auditresults="p"
			return
		else
                        echo "1.10,Disable rosmaster listening on all interfaces by default,Fail" >> "$output_file"
                        auditresult="f"
		fi

		##If remediate is activated, respective remediation to proceed and replace "fail" to "remediated".
		if [ $auditresult == "f" ] && [ $remediate == 1 ]; then
			sed -i '/^ROS_HOSTNAME/d' /etc/environment ## Remove all Entries of ROS_HOSTNAME
			echo '"ROS_HOSTNAME="localhost"' >> /etc/environment ##Add new compliant entry
			sed -i '/1\.10/ s/Fail/Fail,Remediated/g' $output_file  
		fi
	fi
}


		


	
