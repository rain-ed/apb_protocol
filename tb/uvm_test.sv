//######################################################################################################################
//######################################################################################################################
//                           BASE_TEST
//######################################################################################################################
//######################################################################################################################

class apb_base_test extends uvm_test;
	`uvm_component_utils(apb_base_test)

	    apb_env apb_env_h;
 
   //every class object need to be called by some other class now uvm_test(parent) called by child(apb_base_test)	
	//condttructor
function new(string name, uvm_component parent);
super.new(name, parent);
endfunction
//class can have either property or a method, here we're creating memory so
//its neither property nor method.
       
//build_phasewe do for the following 1)create a lower component test(ENV,SEQ),
//env(scb,agent), agent (sqr,drv,mon) 2) config_db(set/get) eg: driver and monitor 3) if you want to create a memory
//note:creating a lower memory compopnent or creating a memory can be done in build-phase/ constructor
 function void build_phase(uvm_phase phase);
		 		super.build_phase(phase);
				apb_env_h=apb_env::type_id::create("apb_env_h",this);//comp
			
endfunction

//no connect

function void end_of_elaboration();
		print();   //print heirarchy from test onwards
	endfunction


endclass

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////.....................WR_TEST.....................///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class apb_wr_test extends apb_base_test;
	`uvm_component_utils(apb_wr_test)

	apb_wr_seq apb_seq_h;     //sequence change
   
function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
apb_seq_h=apb_wr_seq::type_id::create("apb_seq_h");//obj
endfunction


task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_seq_h.start(apb_env_h.apb_agent_h.apb_sqr_h);   //apb_seq_h is a variable whereas apb_seq is a data type
#50;
phase.drop_objection(this);  //if not mentioned we'll reach maximum runtime and then the tool will terminate the process on its own.
                             //reason=to free the liscense if its running unnecessarily.

//or
//phase.phase_done.set_drain_time(this, 50);
//extra 50ns drain time is given coz if any print stmt are pending let it get completed before we call the $finish.
//Standard  drain time: 50ns-300ns

endtask

endclass


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////.....................RD_TEST.....................///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class apb_rd_test extends apb_base_test;
	`uvm_component_utils(apb_rd_test)

	apb_rd_seq apb_seq_h;
   
function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
apb_seq_h=apb_rd_seq::type_id::create("apb_seq_h");//obj
endfunction


task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_seq_h.start(apb_env_h.apb_agent_h.apb_sqr_h);   //apb_seq_h is a variable whereas apb_seq is a data type
#50;
phase.drop_objection(this);  //if not mentioned we'll reach maximum runtime and then the tool will terminate the process on its own.
                             //reason=to free the liscense if its running unnecessarily.

//or
//phase.phase_done.set_drain_time(this, 50);
//extra 50ns drain time is given coz if any print stmt are pending let it get completed before we call the $finish.
//Standard  drain time: 50ns-300ns

endtask

endclass


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////.....................WR_RD_TEST.....................///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class apb_wr_rd_test extends apb_base_test;
	`uvm_component_utils(apb_wr_rd_test)

	apb_wr_rd_seq apb_seq_h;
   
function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
apb_seq_h=apb_wr_rd_seq::type_id::create("apb_seq_h");//obj
endfunction


task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_seq_h.start(apb_env_h.apb_agent_h.apb_sqr_h);   //apb_seq_h is a variable whereas apb_seq is a data type
#50;
phase.drop_objection(this);  //if not mentioned we'll reach maximum runtime and then the tool will terminate the process on its own.
                             //reason=to free the liscense if its running unnecessarily.

//or
//phase.phase_done.set_drain_time(this, 50);
//extra 50ns drain time is given coz if any print stmt are pending let it get completed before we call the $finish.
//Standard  drain time: 50ns-300ns

endtask

endclass


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////.....................RANDOM_TEST.....................///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class apb_random_test extends apb_base_test;
	`uvm_component_utils(apb_random_test)

	apb_random_seq apb_seq_h;
   
function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
apb_seq_h=apb_random_seq::type_id::create("apb_seq_h");//obj
endfunction


task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_seq_h.start(apb_env_h.apb_agent_h.apb_sqr_h);   //apb_seq_h is a variable whereas apb_seq is a data type
#50;
phase.drop_objection(this);  //if not mentioned we'll reach maximum runtime and then the tool will terminate the process on its own.
                             //reason=to free the liscense if its running unnecessarily.

//or
//phase.phase_done.set_drain_time(this, 50);
//extra 50ns drain time is given coz if any print stmt are pending let it get completed before we call the $finish.
//Standard  drain time: 50ns-300ns

endtask

endclass













