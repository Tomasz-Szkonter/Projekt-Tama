
################################################################
# This is a generated script based on design: tama_z
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source tama_z_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-3
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name tama_z

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk [ create_bd_port -dir I clk ]
  set doplyw_0 [ create_bd_port -dir O doplyw_0 ]
  set ilosc_otworow_0 [ create_bd_port -dir I -from 1 -to 0 ilosc_otworow_0 ]
  set kontrolka_0 [ create_bd_port -dir O -from 2 -to 0 kontrolka_0 ]
  set otwor1_0 [ create_bd_port -dir O otwor1_0 ]
  set otwor2_0 [ create_bd_port -dir O otwor2_0 ]
  set otwor3_0 [ create_bd_port -dir O otwor3_0 ]
  set pelny_0 [ create_bd_port -dir I pelny_0 ]
  set polowa_0 [ create_bd_port -dir I polowa_0 ]
  set reset [ create_bd_port -dir I reset ]
  set stan_krytyczny_0 [ create_bd_port -dir I stan_krytyczny_0 ]
  set tryby_0 [ create_bd_port -dir I -from 1 -to 0 tryby_0 ]

  # Create instance: PBlazeZH_0, and set properties
  set PBlazeZH_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:PBlazeZH:1.0 PBlazeZH_0 ]

  # Create instance: czujniki_0, and set properties
  set czujniki_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:czujniki:1.0 czujniki_0 ]

  # Create instance: dekoder_0, and set properties
  set dekoder_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:dekoder:1.0 dekoder_0 ]

  # Create instance: multiplexer_0, and set properties
  set multiplexer_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:multiplexer:1.0 multiplexer_0 ]

  # Create instance: otwory_0, and set properties
  set otwory_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:otwory:1.0 otwory_0 ]

  # Create instance: pamiec_pro_0, and set properties
  set pamiec_pro_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:pamiec_pro:1.0 pamiec_pro_0 ]

  # Create port connections
  connect_bd_net -net Net [get_bd_ports clk] [get_bd_pins PBlazeZH_0/CLK] [get_bd_pins dekoder_0/clk] [get_bd_pins multiplexer_0/clk] [get_bd_pins pamiec_pro_0/clk]
  connect_bd_net -net Net1 [get_bd_ports reset] [get_bd_pins PBlazeZH_0/RESET] [get_bd_pins czujniki_0/reset] [get_bd_pins dekoder_0/reset] [get_bd_pins multiplexer_0/reset] [get_bd_pins otwory_0/reset]
  connect_bd_net -net PBlazeZH_0_ADDRESS [get_bd_pins PBlazeZH_0/ADDRESS] [get_bd_pins pamiec_pro_0/address]
  connect_bd_net -net PBlazeZH_0_OUT_PORT [get_bd_pins PBlazeZH_0/OUT_PORT] [get_bd_pins dekoder_0/dane]
  connect_bd_net -net PBlazeZH_0_PORT_ID [get_bd_pins PBlazeZH_0/PORT_ID] [get_bd_pins dekoder_0/porty] [get_bd_pins multiplexer_0/porty]
  connect_bd_net -net PBlazeZH_0_WRITE_STROBE [get_bd_pins PBlazeZH_0/WRITE_STROBE] [get_bd_pins dekoder_0/write_strobe]
  connect_bd_net -net czujniki_0_czujniki [get_bd_pins czujniki_0/czujniki] [get_bd_pins multiplexer_0/czujnik]
  connect_bd_net -net dekoder_0_doplyw [get_bd_ports doplyw_0] [get_bd_pins dekoder_0/doplyw]
  connect_bd_net -net dekoder_0_ilosc_otworow [get_bd_pins dekoder_0/ilosc_otworow] [get_bd_pins otwory_0/ilosc]
  connect_bd_net -net dekoder_0_kontrolka [get_bd_ports kontrolka_0] [get_bd_pins dekoder_0/kontrolka]
  connect_bd_net -net dekoder_0_wlacznik_otworow [get_bd_pins dekoder_0/wlacznik_otworow] [get_bd_pins otwory_0/wlacznik]
  connect_bd_net -net ilosc_otworow_0_1 [get_bd_ports ilosc_otworow_0] [get_bd_pins multiplexer_0/ilosc_otworow]
  connect_bd_net -net multiplexer_0_dane [get_bd_pins PBlazeZH_0/IN_PORT] [get_bd_pins multiplexer_0/dane]
  connect_bd_net -net otwory_0_otwor1 [get_bd_ports otwor1_0] [get_bd_pins otwory_0/otwor1]
  connect_bd_net -net otwory_0_otwor2 [get_bd_ports otwor2_0] [get_bd_pins otwory_0/otwor2]
  connect_bd_net -net otwory_0_otwor3 [get_bd_ports otwor3_0] [get_bd_pins otwory_0/otwor3]
  connect_bd_net -net pamiec_pro_0_instruction [get_bd_pins PBlazeZH_0/INSTRUCTION] [get_bd_pins pamiec_pro_0/instruction]
  connect_bd_net -net pelny_0_1 [get_bd_ports pelny_0] [get_bd_pins czujniki_0/pelny]
  connect_bd_net -net polowa_0_1 [get_bd_ports polowa_0] [get_bd_pins czujniki_0/polowa]
  connect_bd_net -net stan_krytyczny_0_1 [get_bd_ports stan_krytyczny_0] [get_bd_pins czujniki_0/stan_krytyczny]
  connect_bd_net -net tryby_0_1 [get_bd_ports tryby_0] [get_bd_pins multiplexer_0/tryby]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


