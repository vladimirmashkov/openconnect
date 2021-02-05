#!/bin/bash
sh 01.prepare_os.sh
sh 02.prepare_scripts.sh
sh 03.prepare_soft.sh
sh 04.install_soft.sh
sh 05.cp_and_clean-up.sh
sh 06.start_soft.sh