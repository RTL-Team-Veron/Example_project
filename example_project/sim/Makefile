##################################################################################################
#         VV            VV
#          VV          VV
#           VV        VV  VVVVVVVV  VVVVVVV     VVVVV    VV     VV
#            VV      VV             VV    VV   VV   VV   VVV    VV
#             VV    VV    VVVVVVVV  VVVVVVV   VV     VV  VV VV  VV
#              VV  VV               VV   VV    VV   VV   VV   VVVV
#                VV       VVVVVVVV  VV    VV    VVVVV    VV     VV
#
# Filename    : Makefile
# Description : Example Makefile run on Questasim
# Author      : VeronR&D_phuoc.ha
# Created On  : Wed Jun 4th, 2025
# History (Date ...., Changed By......)

#Example run string: make TESTNAME={name_of_testcase} {optional}
#		     make TESTNAME=counter_test all 
##################################################################################################
#Define variables
TESTNAME 	?= test
TB_NAME 	?= test_bench
RADIX		?= decimal

#==============================
all: build run

all_wave: build run wave

all_cov: build_cov run_cov

build:
	vlib work
	vmap work work
	vlog  -f compile.f | tee compile.log
build_cov:
	vlib work
	vmap work work
	vlog +cover=bcesft -f compile.f
run:
	vsim -debugDB -l $(TESTNAME).log -voptargs=+acc -assertdebug -c $(TB_NAME) -do "log -r /*;run -all;"
run_cov:
	vsim -coverage -l $(TESTNAME).log -c $(TB_NAME) -voptargs="+cover=bcesft" -assertdebug -do "coverage save -onexit $(TESTNAME).ucdb; log -r /*;run -all"
wave:
	vsim -i -view vsim.wlf -do "add wave vsim:/$(TB_NAME)/*; radix -$(RADIX)" &
gen_cov:
	mkdir -p coverage
	vcover merge IP.ucdb *.ucdb
	vcover report IP.ucdb -output coverage/summary_report.txt
	vcover report -zeros -details -code bcesft -annotate -All -codeAll IP.ucdb -output coverage/detail_report.txt
gen_html:
	mkdir -p coverage
	vcover merge IP.ucdb *.ucdb
	vcover report -zeros -details -code bcesft -annotate -testhitdataAll -html IP.ucdb 
clean:
	rm -rf work
	rm -rf vsim.dbg
	rm -rf *.ini
	rm -rf *.log
	rm -rf *.wlf
	rm -rf transcript
	rm -rf *.ucdb
help:
	@echo ""
	@echo "****************************************"
	@echo "** make clean    : clean all compiled data"
	@echo "** make build    : build the design"
	@echo "** make build_cov: build the design in coverage mode"
	@echo "** make run      : run simulation"
	@echo "** make run_cov  : run simulation in coverage mode"
	@echo "** make all      : build and run simulation"
	@echo "** make all_cov  : build and run simulation in coverage mode"
	@echo "** make wave     : open waveform"
	@echo "** make gen_cov  : merge, generate coverage data base and text coverage report"
	@echo "** make gen_html  : merge, generate coverage data base and html coverage report"
	@echo "****************************************"
	@echo ""
